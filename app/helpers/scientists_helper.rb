module ScientistsHelper

  def still_alive?
    "Still among us!" unless @scientist.date_of_death
  end
end
