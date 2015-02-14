class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    projects_path
  end


  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def current_project
    @current_project ||= Project.find(params[:project_id])
  end
  helper_method :current_project

  def user_root_path
    projects_path
  end
  helper_method :user_root_path
end
