class WelcomeController < ApplicationController

  def home
    redirect_to current_user if user_signed_in?
  end
end
