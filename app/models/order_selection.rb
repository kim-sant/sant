class OrderSelection < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :profile
end
