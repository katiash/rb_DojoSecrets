class UserController < ApplicationController
  # SHOULD ACTUALLY SAY ABOVE: UsersController, ie plural:
  # ...made a small mistake on "rails g controller..."
  before_action :require_session_id_match, only:[:show, :edit, :update, :destroy]
  skip_before_action :require_login, except:[:show, :edit]
  
  # get "users/new" => "users#new"
  def new
    #render 'Registration View'
  end

  # post "users" => "users#create"
  def create
    redirect_to 'users/session[:id]' #redirect to 'show' for this user
  end

  # ALL BELOW SHOULD HAVE SESSION[:user_id] = @USER.id
  # Logged-in User should only be able to modify their own User data...
  
  # get "users/:id" => "users#show"
  def show
    #render 'show'
  end

  # # get "users/:id/edit" => "users#edit"
  # def edit
  #   #render 'edit'
  # end

  # # patch "users/:id" => "users#patch"
  # def update
  # end

  # delete "users/:id" => "users#destroy"
  def destroy
  end

  private
  def require_session_id_match
    # or current_user.id should be same as session[:user_id] (don't want to modify current_user though..)
    @user.id=session[:user_id]
  end

end
