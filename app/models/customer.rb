class Customer < ActiveRecord::Base
  
  belongs_to :user
  has_many :addresses
  has_one :cart
  has_many :orders
  
  after_create :create_cart
  
  def create_cart
    cart = Cart.new
    cart.customer_id = self.id
    cart.save
  end
  
end
