class Area < ApplicationRecord
  belongs_to :subject
  has_many :theorems
  has_many :scientists, through: :theorems
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def subject_attributes=(subject_attributes)
    if self.subject.nil?
      self.subject = Subject.new(subject_attributes)
    end
  end
end
