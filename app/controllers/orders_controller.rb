class OrdersController < InheritedResources::Base
  
  def create_order
    customer = current_user.customer
    cart = Cart.find(params[:order][:cart_id])
    order = Order.new
    order.customer_id = customer.id
    order.save
    cart.cart_selections.each do |selection|
      selection.order_copy(order)
      selection.destroy
    end
    order.assign_total
    redirect_to orders_path, notice: "Your order is being processed."
  end
  
  def index
    @customer = current_user.customer
    @orders = @customer.orders
  end
  
end
