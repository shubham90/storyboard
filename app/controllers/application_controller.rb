class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      projects_path
    else
      project_stories_path(current_project.id)
    end
  end

  layout :layout_by_resource

  protected

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
    @current_project ||= current_user.project
  end
  helper_method :current_project
end
