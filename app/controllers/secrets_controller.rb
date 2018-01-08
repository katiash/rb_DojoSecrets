class SecretsController < ApplicationController

  # get "secrets/index" => "secrets#index"
  def index
  end

  # delete "secrets/:secret_id" => "secrets#destroy"
  def destroy
    if current_user == @secret.user
      #allow action
    else
      #do not allow action.
      #no "Delete" button on rendered secret (already on secrets/index.html.erb page..)
      # redirect_to secrets_path
    end
  end

end
