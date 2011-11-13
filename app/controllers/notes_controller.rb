class NotesController < ApplicationController
  def show
    git = Gittastic.new("#{Rails.root}/../notes")
    git.add('.').and.commit({ '-m' => '"Some files"' }).and.push('origin master')
    
    output = "<pre>Command to run: #{git.cmd}\n"
    output << git.![0]
    
    render :text => output
  end

  def create
  end

  def update
  end

end
