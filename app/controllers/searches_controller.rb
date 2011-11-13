class SearchesController < ApplicationController
  def create # POST /searches?q=Bath+Comp+Sci+CS101
    @results = Note.search params[:q], :star => true
    
    respond_to do |format|
      format.json { render :json => @results }
      format.html { render :layout => false }
    end
  end
end