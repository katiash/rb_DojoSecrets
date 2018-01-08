class SessionsController < ApplicationController
  skip_before_action :require_login, except:[:destroy]
  def new
    # render login page
  end
  def create
    # Log User In
    # If authenticate true
      # save user id to session
      # redirect to users profile page
    # If authenticate false
      # add an error message -> flash[:errors]=["Invalid"]
      # redirect to login page
  end
  def destroy
    # Log User Out
    # set session[:user_id] to null
    # redirect to login page 
  end
end
