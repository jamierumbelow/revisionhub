class Note < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :tags
  
  define_index do
    indexes :title
    indexes course.name, :as => :course_name
    indexes course.university.name, :as => :university_name
  end
  
  def git_file_path
    File.expand_path(root_path + "/" + course.university.name.parameterize + '/' + course.name.parameterize + '/' + title.parameterize + '.txt')
  end
  
  def relative_git_file_path
    "/" + course.university.name.parameterize + '/' + course.name.parameterize + '/' + title.parameterize + '.txt'
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
end