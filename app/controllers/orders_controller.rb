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
    order.order_selections.each do |selection|
      if selection.subscription_plan_id.present?
        subscription = Subscription.new
        subscription.subscription_plan_id = selection.subscription_plan_id
        subscription.active = true
        subscription.customer_id = customer.id
        subscription.save
      end
    end
    redirect_to orders_path, notice: "Your order is being processed."
  end
  
  def index
    if signed_in?
      @customer = current_user.customer
      @orders = @customer.orders
      @subscriptions = @customer.subscriptions
    else
      redirect_to root_url, alert: "Create a Sant account to order."
    end
  end
  
end
