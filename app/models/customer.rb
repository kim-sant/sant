class Customer < ActiveRecord::Base
  
  belongs_to :user
  has_many :addresses, :dependent => :destroy
  has_many :payment_methods, :dependent => :destroy
  has_one :cart, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy
  
  def address
    Address.where(customer_id: self.id).where(default: true).first
  end
  
  def payment_method
    PaymentMethod.where(customer_id: self.id).where(default: true).first
  end
  
end
