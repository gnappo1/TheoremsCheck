module UsersHelper

  def admin!
    @user.update(admin: true)
  end

  def user_greetings
    @user ? ("Welcome, " + @user.email) : (@user.email + "'s Profile")
  end
end
