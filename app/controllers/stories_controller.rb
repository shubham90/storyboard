class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :edit, :update, :destroy, :assign, :story, :signup, :un_signup]
  before_action :assigned_project?, only: [:new, :edit, :update, :create, :destroy]
  def index
    @stories = current_project.stories

  end

  def search
    @stories = current_project.stories.where("name LIKE '%#{params[:query]}%' OR description LIKE '%#{params[:query]}%'")
    render 'index'
  end

  def show
  end

  def new
    @story = current_project.stories.build
  end

  def edit
  end

  def update

    if @story.update(story_params)
      redirect_to project_stories_path(current_project), notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def create
    @story = current_project.stories.build(story_params)

    if @story.save
      redirect_to project_stories_path, notice: 'Story was successfully created.'
    else
      render action: 'new'
    end

  end

  def destroy
    @story.destroy
    redirect_to project_stories_path(current_project), notice: 'Story was successfully deleted'
  end

  def signup
    current_project.stories.where(signup_user: current_user).update_all(signup_user_id: nil)
    @story.update(signup_user_id: current_user.id)
    redirect_to project_stories_path, notice: 'Story was successfully signuped'
  end

  def un_signup
    current_project.stories.where(signup_user: current_user).update_all(signup_user_id: nil)
    redirect_to project_stories_path, notice: 'Story was successfully unsignuped'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = current_project.stories.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:name, :points, :stage, :description, :signup_user_id, :project_id, :assign)
  end
end
