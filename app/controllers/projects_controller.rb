class ProjectsController < ApplicationController
	before_action :set_project, only: [:show]
  def index
    @projects = Project.all
  end

  def show
  end

def set_project
  	 @projects=Project.find(params[:id])
  end

end
