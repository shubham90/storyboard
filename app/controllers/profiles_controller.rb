class ProfilesController < ApplicationController
  before_action :authenticate_admin!, only:[:index]
  def index
  end  

  def show
  end

  def edit 
  end

  def update
    current_user.update(user_params)
    if current_user.save
      redirect_to user_root_path, notice: 'Password was successfully updated'
    else
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end