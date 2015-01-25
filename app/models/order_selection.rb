class OrderSelection < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  belongs_to :subscription_plan

end
