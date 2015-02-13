class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :destroy, :edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully deleted' }
      format.json { head :no_content }
    end
  end


  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  private
   
=======

 def edit
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to [current_project, @story], notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

>>>>>>> Project Layout
  def set_project
  	 @project = Project.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:name, :description)
  end

end
