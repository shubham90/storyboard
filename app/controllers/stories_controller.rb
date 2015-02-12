class StoriesController < ApplicationController
  
  def index
    @stories = current_user.project.stories
  end

  def show
    @story = Story.find(params[:id])
  end
end