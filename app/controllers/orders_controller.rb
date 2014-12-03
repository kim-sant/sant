class OrdersController < InheritedResources::Base
  
  def create_order
    user = current_user
    customer = user.customer
    cart = Cart.find(params[:order][:cart_id])
    order = Order.new
    order.customer_id = customer.id
    user.charge(cart.subtotal)
    order.save
    order.copy_cart(cart)
    order.assign_total
    if params[:subscribe].present? && params[:subscribe] == '1'
      order.order_selections.each do |selection|
        s = Subscription.new
        s.product_id = selection.product_id
        s.customer_id = customer.id
        s.save
      end
    end
    redirect_to orders_path, notice: "Your order is being processed."
  end
  
  def index
    if signed_in?
      @customer = current_user.customer
      @orders = @customer.orders
    else
      redirect_to root_url, alert: "Create a Sant account to order."
    end
  end
  
end
