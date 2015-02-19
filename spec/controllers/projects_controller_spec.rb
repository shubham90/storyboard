require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "index" do
  	it "populates the table of projects"
    it "renders the :index template" do
    	get :index
    	response.should render_template :index
    end
  end
  describe "show" do
  	it "captures the project id" do
  		get :show, id: project_id
  		assigns(:id).should eq(project_id)
  	end
    it "renders the :show template" do
    	get :show, id: project_id
    	response.should render_template :show
    end
  end
end

describe 'DELETE destroy' do 
	before :each do 
		@story = Project(:story) 
	end 

it "deletes the contact" do 
	expect{ 
		delete :destroy, id: @story 
		}.to change(Story,:count).by(-1)
		end 

it "redirects to stories#index" do 
	delete :destroy, id: @story
	response.should redirect_to stories_url 

end 
end 
end
