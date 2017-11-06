module ScientistsHelper

  def what_year_is_it?
    Time.now.year
  end

  def scientist_save?
    !current_user.scientists.include?(@scientist)
  end
end
