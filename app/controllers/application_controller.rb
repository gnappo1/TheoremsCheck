class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def check_admin
    if  @current_user && !@current_user.admin?
      redirect_to root_path, notice: 'User not authorized'
    end
  end
end
