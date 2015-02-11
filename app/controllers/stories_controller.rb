class StoriesController < ApplicationController
  
  def index
    @stories = current_user.project.stories
  end

end