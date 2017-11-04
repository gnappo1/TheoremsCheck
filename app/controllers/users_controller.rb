class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!, only: [:show]
  before_filter :check_admin, only: [:index]
  before_filter :set_user, only: [:show, :destroy, :make_admin, :areas_created, :subjects_created, :scientists_created, :theorems_created]
  include UsersHelper

  def index
    @users = User.all
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
    @areas = Area.where(:created_by => @user.email)
  end

  def subjects_created
    @subjects = Subject.find(:all, :conditions => [ "created_by = ?", @user.email])
  end

  def scientists_created
    @scientists = Scientist.find(:all, :conditions => [ "created_by = ?", @user.email])
  end

  def theorems_created
    @theorems = Theorem.find(:all, :conditions => [ "created_by = ?", @user.email])
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
