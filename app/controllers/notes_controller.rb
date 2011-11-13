class NotesController < ApplicationController
  before_filter :load_git
  before_filter :load_etherpad
  
  def show
    @pad = @etherpad.pad(params[:id])
    @note = Note.find params[:id]
    
    puts @note.git_file_path
    
    unless File.exists?(@note.git_file_path)
      @git.add(@note.relative_git_file_path).and.commit('-m "Adding lecture note ' + @note.title + ' (' + @note.course.university.name + ' - ' + @note.course.name + ')"').and.push('origin master')
    end
  end

  def create
    @pad = Pad.create!(params[:pad])
    @etherpad.pad @pad.id
    
    @git.add(@note.relative_git_file_path).and.commit('-m "Adding lecture note ' + @note.title + ' (' + @note.course.university.name + ' - ' + @note.course.name + ')"').and.push('origin master')
    
    redirect_to @pad
  end

  def update
    @pad = @etherpad.pad(params[:id])
    @note = Note.find(params[:id])
    
    @note.write @pad.text
    @git.add(@note.relative_git_file_path).and.commit('-m "Updating lecture note ' + @note.title + ' (' + @note.course.university.name + ' - ' + @note.course.name + ')"').and.push('origin master')
    
    render :json => true
  end

  protected
  
  # I'm sorry about this. I know it's horrible. But it's 5:40am.
  def load_git
    @git = Gittastic.new(root_path)
  end
  
  def load_etherpad
    @etherpad = EtherpadLite.connect(YAML::load(File.open("#{Rails.root}/config/servers.yml"))['etherpad'], YAML::load(File.open("#{Rails.root}/config/servers.yml"))['etherpad_api_key'])
  end
  
  def root_path
    @root_path ||= Rails.root.to_s + YAML::load(File.open("#{Rails.root}/config/servers.yml"))['git']
  end
end