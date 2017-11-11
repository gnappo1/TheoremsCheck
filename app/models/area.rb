class Area < ApplicationRecord
  belongs_to :subject
  has_many :theorems
  has_many :scientists, through: :theorems
  has_many :corollaries, through: :theorems
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
