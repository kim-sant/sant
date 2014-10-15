class Customer < ActiveRecord::Base
  
  belongs_to :user
  has_many :addresses
  has_many :carts
  has_many :orders
end
