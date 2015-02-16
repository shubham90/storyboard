class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy, :edit, :update, :edit_assign_developers, :assign_developers, :unassign_developers]
  before_action :set_unassigned_developers, only: [:new, :edit_assign_developers]
  before_action :authenticate_admin!, only:[:edit_assign_developers, :assign_developers, :unassign_developers]
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

    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end


  def edit
  end

  def edit_assign_developers

  end

  def assign_developers
    @project.users << User.find(params["user_id"])
    if @project.save
      redirect_to edit_assign_developers_project_path, notice: 'Developer was added successfully.'
    else
      redirect_to edit_assign_developers_project_path, alert: 'Error in assigning developer'
    end
  end

  def unassign_developers
    User.find(params["user_id"]).update(project_id: nil)
    if @project.save
      redirect_to edit_assign_developers_project_path, notice: 'Developer was removed successfully.'
    else
      redirect_to edit_assign_developers_project_path, alert: 'Error in assigning developer'
    end
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
    @unassigned_developers = User.developers.where(project_id: nil)
  end


  def project_params
    params.require(:project).permit(:name, :description)
  end

end
