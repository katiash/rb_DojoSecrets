class SecretsController < ApplicationController
  #=============================================================================
  # before_action :require_login    - inherited to run from applicationController
  #==============================================================================
  
  # get "secrets/index" => "secrets#index"
  def index
    @secrets = Secret.all
    # if secret.user is the logged in user, display "delete" button
  end

  # post "secrets" => "secrets#create"
  def create
    puts "In Secrets Controller, 'secret' create method"
    puts "params in 'secret' create method: #{params}"
    # puts "params[:secret][:content]",params[:secret][:content] 
    puts "Current user is: ", current_user

    @secret = Secret.new(user: current_user, content: params[:secret][:content])
    #COMMENTED OUT IN users/show.html.erb VIEW THAT SENDS TO THIS METHOD via CREATE SECRET route:
    #@secret = Secret.new(user: current_user, content: params[:content])

    puts "Secret valid?", @secret.valid?
    if @secret.save
      puts "success for secret.save"
      redirect_to "/users/#{current_user.id}"
    else
      puts "@secret not saved, here is what was entered", @secret.inspect
      @secrets=Secret.all
      render :action=> '.././user/show', :id => current_user.id
    end
  end

  # delete "secrets/:secret_id" => "secrets#destroy"
  def destroy
    puts "In Secrets destroy method: params are: ", params.inspect
    @secret = Secret.find(params[:secret_id])
    puts "@secret found in destroy method is: ", @secret
    if current_user.id == @secret.user.id
      puts "Current user is the Secret Owner. Destroying secret..."
      @secret.destroy
      puts "@secret after destroy: ", @secret
      redirect_to "/users/#{current_user.id}"
    else
      # puts "Something went wrong in Secret destroy"
      redirect_to "/users/#{current_user.id}"
    end
  end

end
