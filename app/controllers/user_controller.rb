class UserController < ApplicationController
  # SHOULD ACTUALLY SAY ABOVE: UsersController, ie plural:
  # ...made a small mistake on "rails g controller..."

  skip_before_action :require_login, except:[:show, :edit]
  
  def new
  end

  def create
  end

  def show
  end

  def edit
  end
end
