class WelcomeController < ApplicationController

  def home
    redirect_to current_user if user_signed_in?
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
