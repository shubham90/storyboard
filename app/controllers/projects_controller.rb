class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy, :edit, :update]
  before_action :set_unassigned_developers, only: [:new, :edit]
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



  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_unassigned_developers
    @unassigned_developers=User.where(role: ROLES[:developer], project_id: nil)
  end


  def project_params
    params.require(:project).permit(:name, :description, :user_ids)
  end

end
