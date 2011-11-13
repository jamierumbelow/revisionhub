class Note < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :tags
  
  define_indexes do
    indexes :title
  end
  
  def git_file_path
    YAML::load(File.open("#{Rails.root}/config/servers.yml"))['git'] + "/" + course.university.name + '/' + course.name + '/' + name + '.txt'
  end
  
  def write(content)
    File.open git_file_path, 'w+' do |f|
      f.puts content
    end
  end
end