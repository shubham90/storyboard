class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    case params[:filter]
    when "admins"
      @users = User.where(role: ROLE[:admin])
    when "developers"
      @users = User.where(role: ROLE[:developer])
    else
      @users = User.all
    end
  end

  private

  def authenticate_admin!
    !current_user.is_admin? and redirect_to(root_path) 
  end
end
