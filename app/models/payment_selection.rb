class PaymentSelection < ActiveRecord::Base
  
  belongs_to :payment_method
  belongs_to :order
  
end
