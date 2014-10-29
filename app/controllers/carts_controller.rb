class CartsController < InheritedResources::Base
  
  def show
    if user_signed_in?
      @customer = current_user.customer
      @cart = Cart.where(customer_id: @customer.id).first
    else
      @cart = Cart.find(session[:cart_id])
    end
  end
  
  def increase_quantity
    selection = CartSelection.find(params[:cart_selection_id])
    selection.quantity = selection.quantity + 1
    selection.save
    redirect_to customer_cart_url
  end
  
  def decrease_quantity
    selection = CartSelection.find(params[:cart_selection_id])
    if selection.quantity > 1
      selection.quantity = selection.quantity - 1
      selection.save
    else
      selection.destroy
    end
    redirect_to customer_cart_url
  end
  
  def checkout
    if user_signed_in?
      redirect_to new_url_path
    else
      redirect_to new_user_session_path
    end
  end
  
  def delivery_info
    
  end
  
  def payment_info
    
  end
  
end
