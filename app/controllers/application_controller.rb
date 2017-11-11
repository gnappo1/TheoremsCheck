class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def check_admin
    unless  current_user && current_user.admin?
      redirect_to root_path, notice: 'User not authorized'
    end
  end
end
