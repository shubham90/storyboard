class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:destroy]
  def index
    @admins = User.admins
  end

  def new
    @admin = User.new
  end

  def create
     @admin = User.new(admin_params)
     @admin.role = ROLES[:admin]

    if @admin.save
      redirect_to admins_path, notice: 'Admin was successfully created'
    else
      render action: 'new'
    end
  end

  def destroy
    @admin.destroy

    redirect_to developers_path, notice: 'Admin was successfully deleted'
  end


  private

  def set_admin
    @admin = User.find(params[:id])
  end

  def admin_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authenticate_admin!
    !current_user.is_admin? and redirect_to(root_path)
  end
end
