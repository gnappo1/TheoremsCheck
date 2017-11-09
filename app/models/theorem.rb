class Theorem < ApplicationRecord
  has_many :corollaries
  belongs_to :scientist
  belongs_to :area
  belongs_to :subject
  has_and_belongs_to_many :users

  validates_presence_of :statement
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def area_attributes=(area_attributes)
    area_attributes.each do |k, v|
      @area = Area.new(name: v['name'])
      if v['subject_id'].nil?
        @subject = Subject.new(v['subject_attributes'])
        if @subject.save
          @area.subject = @subject
          @area.save
        end
      else
        @area.subject = Subject.find_by(id: v['subject_id'])
        @area.save
      end
    end
  end

  def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

end
