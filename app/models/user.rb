class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :scientists
  has_and_belongs_to_many :theorems
  has_and_belongs_to_many :corollaries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :github]


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      elsif data = session["devise.github_data"] 
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  def resources_added_count(resource)
    Object.const_get(resource).all.where({created_by: self.email}).count
  end

  def add_to_fav(resource)
    if resource.class == Scientist
      if !self.scientists.include?(resource)
        self.scientists << resource
      end
    elsif resource.class == Theorem
      if !self.theorems.include?(resource)
        self.theorems << resource
      end
    end
  end

  def remove_from_fav(resource)
    if resource.class == Scientist
      self.scientists.delete(resource)
    elsif resource.class == Theorem
      self.theorems.delete(resource)
    end
  end
end
