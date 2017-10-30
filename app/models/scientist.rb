class Scientist < ApplicationRecord
  has_many :theorems
  has_many :areas, through: :theorems

  validates :full_name, presence: true, uniqueness: { case_sensitive: false }
  validates :year_of_birth, presence: true
  validate :year_of_birth_cannot_be_in_the_future

  def year_of_birth_cannot_be_in_the_future
    if year_of_birth > Date.today.year
      errors.add(:year_of_birth, "Can't be in the future")
    end
  end

  def birth_before_christ?
    year_of_birth < 0 ? (year_of_birth.abs.to_s + " BC") : year_of_birth
  end

  def death_before_christ?
    if year_of_death
      if year_of_death.to_f < 0
        return year_of_death.abs.to_s + " BC"
      else
        return year_of_death
      end
    else
      return "Still among us!"
    end
  end
end
