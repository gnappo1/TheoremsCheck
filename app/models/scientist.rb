class Scientist < ApplicationRecord
  has_many :theorems
  has_many :corollaries, through: :theorems
  has_many :areas, through: :theorems
  has_many :subjects, through: :theorems
  has_and_belongs_to_many :users
  has_many :quotes

  validates :full_name, presence: true, uniqueness: { case_sensitive: false }
  validates :year_of_birth, presence: true
  validate :year_of_birth_cannot_be_in_the_future
  validate :birth_comes_before_death

  def theorems_attributes=(theorems_attributes)
    theorems_attributes.each do |k, v|
      @theorem = self.theorems.build(name: v['name'])
      @theorem.statement = v['statement']
      @theorem.demonstration = v['demonstration']
      @theorem.created_by = v['created_by']
      if v['area_id'].empty?
        @area = Area.new(v['area_attributes'])
        if v['area_attributes']['subject_id'].nil?
          @subject = Subject.new(v['area_attributes']['subject_attributes'])
          @area.subject = @subject
          @area.save
          @theorem.subject = @subject
          @theorem.save
        else
          @area.save
          @theorem.area = @area
          @theorem.subject = Subject.find_by(id: v['area_attributes']['subject_id'])
          @theorem.save
        end
      else
        @area = Area.find_by(id: v['area_id'])
        @theorem.area = @area
        @theorem.subject = @area.subject
        @theorem.save
      end
    end
  end

  def year_of_birth_cannot_be_in_the_future
    if year_of_birth > Date.today.year
      errors.add(:year_of_birth, "Can't be in the future")
    end
  end

  def birth_before_christ?
    year_of_birth < 0 ? (year_of_birth.abs.to_s + " BC") : year_of_birth
  end

  def death_before_christ?
    if year_of_death
      if year_of_death.to_f < 0
        return year_of_death.abs.to_s + " BC"
      else
        return year_of_death
      end
    else
      return "Still among us!"
    end
  end

  def birth_comes_before_death
    if year_of_birth > year_of_death
      errors.add(:year_of_birth, "Must be before Year of Death")
    end
  end

end
