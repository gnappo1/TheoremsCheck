module ApplicationHelper

  def resource_save?(resource)
    if resource.class == Scientist
      !current_user.scientists.include?(resource)
    elsif resource.class == Theorem
      !current_user.theorems.include?(resource)
    end
  end
end
