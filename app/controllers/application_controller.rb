class ApplicationController < ActionController::Base

  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  # Method available to ALL other controllers:
  # Initializes "current_user" object, if someone is logged in:
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end 
    #Define it as helper_method to use in all your Views too!
  helper_method :current_user
  

  private
  def require_login
  # if current_user
    if session[:user_id]
      # ALLOW ACCESS
      # @user.id = session[:user_id] ( = current_user.id)
    else
      # redirect_to 'login' page/view.
    end
  end

end
