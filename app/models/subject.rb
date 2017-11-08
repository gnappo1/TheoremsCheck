class Subject < ApplicationRecord
  has_many :areas
  has_many :theorems, through: :areas
  has_many :corollaries, through: :theorems
  has_many :scientists, through: :areas
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
