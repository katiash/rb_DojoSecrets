  # ( SHOULD ACTUALLY BE: UsersController, ie "Users" is plural, ... )
  # (I made a mistake when creating via terminal "rails g controller..." )

  class UserController < ApplicationController

  # >>>>>>>>>>>>>>>>>
  skip_before_action :require_login, except:[:show]
  # >>>>>>>>>>>>>>>>>

  # get "users/new" => "users#new" (registration form view)
  def new
    @user = User.new
    puts "In user(s) controller, 'new'(register new user) method"
  end

  # post "users" => "users#create"
  def create
    @user=User.new(user_create_params)
    if @user.save
      flash[:notice] = ["User successfully created, and redirected to login screen!"]
      redirect_to "/" #redirects to the login view, sessions controller
    else
      flash.now[:notice] = ["User was not created. See errors below."]
      flash.now[:errors] << @user.errors.full_messages
      render 'new'
    end
  end

  # get "users/:id" => "users#show"
  def show
    puts "In user(s)#show method, w/ params of: ", params.inspect
    puts "In user(s)#show method, current_user is #{current_user}"
    
    @user_secrets = current_user.secrets # ENABLE "Delete secret" 
    puts "user secrets are: ", @user_secrets.inspect
    @secrets_liked = current_user.secrets_liked 

    @secret = Secret.new
    @secret.user = current_user
    # CAN PASS LOCAL OBJECTS TO VIEWS AND PARTIALS LIKE SO:
    # render :partial => '/shared/instances_new', :locals=>{:new_instance => @new_instance}
  end

  private


  def user_create_params
    params.require(:user).permit(:email, :name, :password)
  end
end
