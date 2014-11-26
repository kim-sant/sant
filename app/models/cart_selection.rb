class CartSelection < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :product
  
  def order_copy(order)
    selection = OrderSelection.new
    selection.order_id = order.id
    selection.product_id = self.product_id
    selection.quantity = self.quantity
    selection.save
  end
  
end
