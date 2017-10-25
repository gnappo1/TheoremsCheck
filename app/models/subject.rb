class Subject < ApplicationRecord
  has_many :areas
  validates :name, presence: true 
end
