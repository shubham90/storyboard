class StoryboardsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @projects = Project.all
  end
end
