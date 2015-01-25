class CartSelection < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :product
  belongs_to :subscription_plan
  
  def order_copy(order)
    selection = OrderSelection.new
    selection.order_id = order.id
    if self.product_id.present?
      selection.product_id = self.product_id
    else
      selection.subscription_plan_id = self.subscription_plan_id
    end
    selection.quantity = self.quantity
    selection.save
  end
  
end
