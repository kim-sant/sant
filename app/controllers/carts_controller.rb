class CartsController < InheritedResources::Base
  
  def cart
    if user_signed_in?
      @customer = current_user.customer
    if @customer.cart.present?
      @cart = @customer.cart
    else
      
    end
  end
  
  def checkout
    if 
  end
  
end
