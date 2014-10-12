class Cart < ActiveRecord::Base
  
  has_many :cart_selections
  belongs_to :profile
end
