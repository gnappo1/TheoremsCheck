class Quote < ApplicationRecord
  belongs_to :scientist
  validates_presence_of :text
  validates_uniqueness_of :text
end
