class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @stories = current_user.project.stories.includes(:developers)
  end

  def show
  end

  def new
    @story = current_project.stories.build
  end

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

  def create
    @story = current_project.stories.build(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to project_stories_path, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to project_stories_path, notice: 'Story was successfully deleted' }
      format.json { head :no_content }
    end
  end

  def assign
    if params[:story][:assign] == 1
      @story.developers << current_user
      msg = 'Developer is successfully assigned'
    elsif params[:story][:assign] == 0
      @story.developers.delete(current_user)
      msg = 'Developer is successfully de-assigned'
    else

    end

    respond_to do |format|
      if @story.save
        format.json { render json: @story }
        format.html { redirect_to project_stories_path, notice: msg }
      else
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def signup

    respond_to do |format|
    format.html { redirect_to project_stories_path, notice: 'Story was successfully signuped' }
  end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:name, :points, :stage, :description, :signup_user_id, :project_id, :assign)
  end
end
