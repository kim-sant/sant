class Order < ActiveRecord::Base
  
  has_many :order_selections
  belongs_to :customer
end
