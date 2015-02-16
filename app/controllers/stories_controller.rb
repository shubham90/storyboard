class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :edit, :update, :destroy, :assign, :story, :signup, :un_signup]

  def index
    case params[:scope]
    when "assigned"
      @stories = current_user.stories.where(project_id: current_project.id)
    when "signup"
      @stories = current_user.stories.where(project: current_project, signup_user_id: current_user.id)
    else
      @stories = current_project.stories
    end
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

  def assign
    if params[:story][:assign].to_i == 1
      @story.developers << current_user
      msg = "Developer Assigned"
    elsif params[:story][:assign].to_i == 0
      @story.developers.destroy(current_user)
      @story.update(signup_user_id: nil)
      msg = "Developer Unassigned"
    else

    end


    if @story.save
      redirect_to project_stories_path(current_project), notice: msg
    else
      redirect_to project_stories_path(current_project), status: :unprocessable_entity
    end

  end

  def signup
    if @story.developers.exists? current_user.id
      current_project.stories.where(signup_user: current_user).update_all(signup_user_id: nil)
      @story.update(signup_user_id: current_user.id)
      redirect_to project_stories_path, notice: 'Story was successfully signuped'
    else
      redirect_to project_stories_path, alert: 'Assign the story to signup '
    end
  end

  def un_signup
    if @story.developers.exists? current_user.id
      current_project.stories.where(signup_user: current_user).update_all(signup_user_id: nil)
      redirect_to project_stories_path, notice: 'Story was successfully unsignuped'
    else
      redirect_to project_stories_path, alert: 'Assign the story to signup '
    end
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
