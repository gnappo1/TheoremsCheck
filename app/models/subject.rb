class Subject < ApplicationRecord
  has_many :areas
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
