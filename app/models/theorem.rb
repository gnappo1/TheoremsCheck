class Theorem < ApplicationRecord
  belongs_to :scientist
  belongs_to :area

  validates_presence_of :statement
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
