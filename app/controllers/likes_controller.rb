class LikesController < ApplicationController

  # post "likes" => "likes#create"
  def create
    session[:dummy]="I don't mean anything"
    puts "params passed are: ", params.inspect
    # if current_user == @secret.user
    @like = Like.new(user_id: params[:user], secret_id: params[:secret])
    puts @like.inspect
    puts @like.valid?
    if @like.save
      puts "like seems to have saved"
      @secrets=Secret.all
      render "secrets/index"
    else
      puts "something went wrong on Like action"
      redirect_to secrets_path, notice: "Successfully liked a secret!" 
    end
  end

  # delete "likes/:like_id" => "likes#destroy"
  def destroy
    puts "Got to Unlike method"
    puts "our params are: ", params.inspect
    @like = Like.where("user_id = ? AND secret_id = ?", params[:user], params[:secret])
    # @like = Like.find(:condition=>["user=? and secret=?", params[:user], params[:secret]])
    puts "Got our Like to destroy: ", @like.inspect
    if @like[0].destroy
      puts "Seems to have destroyed like", @like
      redirect_to "/secrets"
    else
      puts "Something went wrong on Like destroy"
      redirect_to "/secrets"
    end
    # if current_user == @secret.user
    #   #allow action
    # else
    #   #do not allow action.
    #   #no "Delete" button on rendered secret (already on secrets/index.html.erb page..)
    #   # redirect_to secrets_path
    # end
  end
end
