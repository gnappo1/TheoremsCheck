class Corollary < ApplicationRecord
  belongs_to :theorem
  belongs_to :area
  belongs_to :subject
  has_and_belongs_to_many :users

  validates_presence_of :statement
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
