class SessionsController < ApplicationController
  
  skip_before_action :require_login, except:[:destroy]
  
  # get "sessions/new" => "sessions#new"
  def new
    # render 'login' page
  end

  # post "sessions" => "sessions#create"
  def create
    # Log User In
    # If authenticate true
      # save user id to session
      # redirect_to users profile page (i.e. get 'users/:id')
    # If authenticate false
      # add an error message -> flash[:errors]=["Invalid"]
      # redirect_to 'login' view
  end

  # delete "sessions/:id" => "sessions#destroy"
  def destroy
    # Log User Out
    # set session[:user_id] to null
    # redirect to 'login' page 
  end
end
