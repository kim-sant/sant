class CartSelection < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :customer
end
