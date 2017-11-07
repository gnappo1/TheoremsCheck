module ScientistsHelper

  def what_year_is_it?
    Time.now.year
  end

  def condition(collection)
    collection == "theorems" ? (return true if @scientist.theorems.count > 3) : (return true if @scientist.quotes.count > 3)
  end
end
