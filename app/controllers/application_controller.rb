class ApplicationController < ActionController::Base

  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Method available to ALL other controllers:
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end # Returns user object to "current_user".
  helper_method :current_user  #Define it as helper_method to use in all your Views too!

  private
  def require_login
  end

end
