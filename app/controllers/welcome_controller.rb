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

  def jolly
    @quote = Quote.all.sample
    render '/quotes/jolly'
  end

  def created_today
    @theorems = Theorem.created_today
    @scientists = Scientist.created_today
    render '/welcome/todays'
  end

  def top_3
    @scientists_array = Scientist.top_3_scientists
    @theorems_array = Theorem.top_3_theorems
    render '/scientists/top_3'
  end
end
