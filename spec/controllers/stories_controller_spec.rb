require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  describe "index" do
    it "populates the table of stories"
    it "renders the :index template" do
      get :index
      response.should render_template :index
    end
  end
  describe "show" do
    it "captures the story id" do
      get :show, id: story_id
      assigns(:id).should eq(story_id)
    end
    it "renders the :show template" do
      get :show, id: story_id
      response.should render_template :show
    end
  end
end

  describe 'DELETE destroy' do 
    before :each do 
      @story = Story(:id) 
    end 

  it "deletes the story" do 
    expect{ 
      delete :destroy, id: @story 
      }.to change(Story,:count).by(-1)
      end 

  it "redirects to stories#index" do 
    delete :destroy, id: @story
    response.should redirect_to project_stories_url 

  end 
end 
end