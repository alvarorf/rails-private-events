class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :current_event, :logged_in?

  protected


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_event
    @current_event ||= Event.find(session[:user_id]) if current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action.'
    redirect_to login_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
