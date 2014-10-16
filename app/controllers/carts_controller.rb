class CartsController < InheritedResources::Base
  
  def show
    if user_signed_in?
      @customer = current_user.customer
      @cart = Cart.where(customer_id: @customer.id).first
    else
      @cart = Cart.find(session[:cart_id])
    end
  end
  
  def checkout

  end
  
end
