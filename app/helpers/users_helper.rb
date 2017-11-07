module UsersHelper

  def admin!
    @user.update(admin: true)
  end

  def user_greetings
    @user ? ("Welcome, " + @user.email) : (@user.email + "'s Profile")
  end

  def conditions
    return true if current_user.scientists.count > 3 && current_page?('/')
  end
end
