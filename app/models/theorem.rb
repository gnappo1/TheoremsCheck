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
      @area.subject = Subject.find_by(id: v['subject_id'])
      @area.created_by = v['created_by']
      if @area.save
        self.area = @area
        self.subject = @area.subject
      end
    end
  end

  def scientist_attributes=(scientist_attributes)
    scientist_attributes.each do |k, v|
      @scientist = Scientist.new(full_name: v['full_name'])
      @scientist.year_of_birth = v['year_of_birth']
      @scientist.year_of_death = v['year_of_death']
      @scientist.created_by = v['created_by']
      @scientist.save
    end
  end


  def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

end
