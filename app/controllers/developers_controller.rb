class DevelopersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_developer, only: [:destroy]
  def index
    @developers = User.developers
  end

  def new
    @developer = User.new
  end

  def create
     @developer = User.new(developer_params)
     @developer.role = ROLES[:developer]

    if @developer.save
      redirect_to developers_path, notice: 'Developer was successfully created'
    else
      render action: 'new'
    end
  end

  def destroy
    @developer.destroy

    redirect_to developers_path, notice: 'Developer was successfully deleted'
  end


  private

  def set_developer
    @developer = User.find(params[:id])
  end

  def developer_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authenticate_admin!
    !current_user.is_admin? and redirect_to(root_path)
  end
end
