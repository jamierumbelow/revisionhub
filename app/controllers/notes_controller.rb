class NotesController < ApplicationController
  before_filter :load_git
  before_filter :load_etherpad
  
  def show
    @pad = @etherpad.pad(params[:id])
  end

  def create
    @pad = Pad.create!(params[:pad])
    @etherpad.pad @pad.id
    
    redirect_to @pad
  end

  def update
    @pad = @etherpad.pad(params[:id])
    @note = Note.find(params[:id])
    
    @note.write @pad.text
    render :json => true
  end

  protected
  
  # I'm sorry about this. I know it's horrible. But it's 5:40am.
  def load_git
    @git = Gittastic.new(YAML::load(File.open("#{Rails.root}/config/servers.yml"))['git'])
  end
  
  def load_etherpad
    @etherpad = EtherpadLite.connect(YAML::load(File.open("#{Rails.root}/config/servers.yml"))['etherpad']z, YAML::load(File.open("#{Rails.root}/config/servers.yml"))['etherpad_api_key'])
  end
end