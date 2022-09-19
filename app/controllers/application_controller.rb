class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :update_allowed_parameters, if: :devise_controller?

  # def login_required
  #   if user_signed? == false
  #     redirect_to user_session_path, :notice => "Log in to access this"
  #   end
  # end

  # def current_user
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #     @current_user
  #   else
  #     false
  #   end
  # end

  # helper_method :current_user
  
  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end
end
