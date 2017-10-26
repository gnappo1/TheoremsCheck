class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!, only: [:show]
  before_filter :check_admin, only: [:index]
  before_filter :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show  
  end

  def destroy
    @user.destroy
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
