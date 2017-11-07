class Quote < ApplicationRecord
  belongs_to :scientist
  validates_presence_of :text
end
