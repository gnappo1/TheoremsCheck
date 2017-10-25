class Area < ApplicationRecord
  belongs_to :subject
  validates :name, presence: true
end
