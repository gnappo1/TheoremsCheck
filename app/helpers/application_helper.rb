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

  def save(resource)
    str = "save_"
    return str + resource.class.name.downcase
  end

  def unsave(resource)
    str = "unsave_"
    return str + resource.class.name.downcase
  end

  def no_proof?(resource)
    resource.demonstration.empty? ? (return "No demonstration yet!") : resource.demonstration
  end

  def find_scientist(index)
    name = @scientists_array[index][:name]
    @scientist = Scientist.find_by(full_name: name)
  end

  def find_theorem(index)
    name = @theorems_array[index][:name]
    @theorem = Theorem.find_by(name: name)
  end
end
