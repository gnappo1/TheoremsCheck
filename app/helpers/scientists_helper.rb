module ScientistsHelper

  def still_alive?
    return "Still among us!" unless @scientist.date_of_death
  end

  def what_year_is_it?
    Time.now.year
  end
end
