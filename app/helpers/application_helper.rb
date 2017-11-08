module ApplicationHelper

  def resource_save?(resource)
    if resource.class == Scientist
      !current_user.scientists.include?(resource)
    elsif resource.class == Theorem
      !current_user.theorems.include?(resource)
    end
  end

  def user_by_email(email)
    @user = User.find_by(email: email)
  end
end
