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
  describe "new" do
  	it "assigns a new project to @project" do
  		get :new
  	end
    it "renders the :new template"
  end
  describe "create" do
  	context "with valid credentials of admin" do
  	it "saves new project to the database" do
  		post :create, contact: Project.attributes_for(:id)
  		response.should render_template :new
  	end
    it "redirects to the :index template"
  end
end
