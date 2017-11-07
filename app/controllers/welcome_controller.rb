class WelcomeController < ApplicationController

  def home
    redirect_to current_user if user_signed_in?
  end

  def fav_theorems
    @theorems = current_user.theorems.sort { |a,b| a.name.downcase <=> b.name.downcase }
    render '/users/fav_theorems'
  end

  def fav_scientists
    @scientists = current_user.scientists.sort { |a,b| a.full_name.downcase <=> b.full_name.downcase }
    render '/users/fav_scientists'
  end
end
