class Note < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :tags
  
  after_create :create_git_stuff
  
  define_index do
    indexes :title
    indexes course.name, :as => :course_name
    indexes course.university.name, :as => :university_name
  end
  
  def git_file_path
    File.expand_path(root_path + "/" + course.university.name.parameterize + '/' + course.name.parameterize + '/' + title.parameterize + '.txt')
  end
  
  def relative_git_file_path
    course.university.name.parameterize + '/' + course.name.parameterize + '/' + title.parameterize + '.txt'
  end
  
  def write(content)
    unless File.exists?(root_path + "/" + course.university.name.parameterize)
      Dir.mkdir(root_path + "/" + course.university.name.parameterize) 
    end
    
    unless File.exists?(root_path + "/" + course.university.name.parameterize + '/' + course.name.parameterize)
      Dir.mkdir(root_path + "/" + course.university.name.parameterize + '/' + course.name.parameterize)
    end
    
    File.open git_file_path, 'w+' do |f|
      f.puts content
    end
  end
  
  def root_path
    @root_path ||= Rails.root.to_s + YAML::load(File.open("#{Rails.root}/config/servers.yml"))['git']
  end
  
  protected
  
  def create_git_stuff
    @git = Gittastic.new(root_path)
    @git.add(relative_git_file_path).and.commit('-m "Adding lecture note ' + title + ' (' + course.university.name + ' - ' + course.name + ')"').and.push('origin master').!
    @git.pull('origin master').!
    @git.push('origin master').!
  end
end