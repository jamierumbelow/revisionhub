class Note < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :tags
  
  define_index do
    indexes :title
    indexes course.name, :as => :course_name
    indexes course.university.name, :as => :university_name
  end
  
  def git_file_path
    YAML::load(File.open("#{Rails.root}/config/servers.yml"))['git'] + "/" + course.university.name + '/' + course.name + '/' + name + '.txt'
  end
  
  def relative_git_file_path
    "/" + course.university.name + '/' + course.name + '/' + name + '.txt'
  end
  
  def write(content)
    File.open git_file_path, 'w+' do |f|
      f.puts content
    end
  end
end