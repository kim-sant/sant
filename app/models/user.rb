class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :customer, :dependent => :destroy
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
  
  def charge(amount)
    Stripe::Charge.create(
        :amount => (amount * 100).to_i, # in cents
        :currency => "usd",
        :customer => self.customer.payment_method.stripe_customer_token
    )
  end
end
