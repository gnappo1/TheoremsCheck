class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!, only: [:show]
  before_filter :check_admin, only: [:index]
  before_filter :set_user, only: [:show, :destroy, :make_admin, :areas_created, :subjects_created, :scientists_created, :theorems_created]
  include UsersHelper

  def index
    @users = User.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @user.destroy
  end

  def make_admin
    admin!
    redirect_to @user, success: "Successfully changed into admin!"
  end

  def areas_created
    @areas = Area.where(:created_by => @user.email).sort { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def subjects_created
    @subjects = Subject.where(:created_by => @user.email).order(name: :desc).sort { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def scientists_created
    @scientists = Scientist.where(:created_by => @user.email).sort { |a,b| a.full_name.downcase <=> b.full_name.downcase }
  end

  def theorems_created
    @theorems = Theorem.where(:created_by => @user.email).sort { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    unless current_user = User.find(params[:id]) || current_user.admin?
      redirect_to root_path, notice: 'User not authorized'
    end
  end

end
