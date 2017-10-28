class Scientist < ApplicationRecord
  validates :full_name, presence: true, uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence:true
  validates :gender, presence: true


  def still_alive?
    return "Still among us!" if !self.date_of_death
  end
end
