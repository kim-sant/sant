class OrdersController < InheritedResources::Base
  
  def create_order
    user = current_user
    customer = user.customer
    cart = Cart.find(params[:order][:cart_id])
    order = Order.new
    order.customer_id = customer.id
    user.charge(cart.subtotal)
    order.assign_total
    order.save
    if params[:order][:subscribe].present? && params[:order][:subscribe] == '1'
      order.order_selections.each do |selection|
        s = Subscription.new
        s.product_id = selection.product_id
        s.customer_id = customer.id
      end
    end
    cart.cart_selections.each do |selection|
      selection.order_copy(order)
      selection.destroy
    end
    redirect_to orders_path, notice: "Your order is being processed."
  end
  
  def index
    @customer = current_user.customer
    @orders = @customer.orders
  end
  
end
