class AddressSelection < ActiveRecord::Base
  
  belongs_to :address
  belongs_to :order
  
end
