class SearchesController < ApplicationController
  def create # POST /searches?q=Bath+Comp+Sci+CS101
    results = ThinkingSphinx::Search.search params[:q], :classes => [ University, Course, Tag, Note ]
    
    respond_to do |format|
      format.json { render :json => results }
    end
  end
end