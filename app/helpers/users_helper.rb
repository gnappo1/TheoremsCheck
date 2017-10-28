module UsersHelper

  def admin!
    @user.update(admin: true)
  end

  def user?
    current_user === @user
  end
end
