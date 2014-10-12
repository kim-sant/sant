class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile 
  after_create :registration_confirmation
  after_create :create_profile
  
  def registration_confirmation
    UserMailer.registration_confirmation(self).deliver
  end
  
  def create_profile
    profile = Profile.new
    profile.user_id = self.id
    profile.save
  end
end
