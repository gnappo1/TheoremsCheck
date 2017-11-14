class Theorem < ApplicationRecord
  has_many :corollaries
  belongs_to :scientist
  belongs_to :area
  belongs_to :subject
  has_and_belongs_to_many :users

  validates_presence_of :statement
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :created_today, -> {where("created_at >= ?", Date.today)}
  #scope :created_today, -> { created_between_period(Time.now.midnight, Time.now.end_of_day) }



  def area_attributes=(area_attributes)
    if self.area_id.nil?
      @area = Area.new(area_attributes)
      if @area.save
        self.area = @area
        self.subject = @area.subject
      end
    end
  end

  def scientist_attributes=(scientist_attributes)
    if self.scientist_id.nil?
      @scientist = Scientist.new(scientist_attributes)
      if @scientist.save
        self.scientist = @scientist
      end
    end
  end

  def self.top_3
    self.all.each do |t|
      t.users.count
    end
  end


  def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

end
