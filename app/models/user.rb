class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :customer 
  after_create :registration_confirmation
  after_create :create_customer
  
  def registration_confirmation
    UserMailer.registration_confirmation(self).deliver
  end
  
  def create_customer
    customer = Customer.new
    customer.user_id = self.id
    customer.save
  end
end
