require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "show" do
  	it "captures the user id" do
  		get :show, id: user_id
  		assigns(:id).should eq(user_id)
  	end
    it "renders the :show template" do
    	get :show, id: user_id
    	response.should render_template :show
    end
  end
end

end 
end