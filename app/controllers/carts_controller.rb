class CartsController < InheritedResources::Base
  
  def show
    if user_signed_in?
      @customer = current_user.customer
      if session[:cart_id].present? && Cart.where(id: session[:cart_id]).present?
  		  @cart = Cart.find(session[:cart_id])
        if @customer.cart.present? && @customer.cart != @cart
          cart = Cart.find(@customer.cart)
          cart.destroy
        end
        @cart.customer_id = @customer.id
        @cart.save
        session.delete(:cart_id)
      else
        @cart = Cart.where(customer_id: @customer.id).first
      end
    elsif session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
    end
  end
  
  def increase_quantity
    selection = CartSelection.find(params[:cart_selection_id])
    selection.quantity = selection.quantity + 1
    selection.save
    page = params[:page]
    if page == "cart"
      redirect_to customer_cart_url
    else
      redirect_to products_url
    end
  end
  
  def decrease_quantity
    selection = CartSelection.find(params[:cart_selection_id])
    if selection.quantity > 1
      selection.quantity = selection.quantity - 1
      selection.save
    else
      selection.destroy
    end
    page = params[:page]
    if page == "cart"
      redirect_to customer_cart_url
    else
      redirect_to products_url
    end
  end
  
  def checkout
    if user_signed_in?
      redirect_to "/users/sign_in"
    else
      redirect_to new_user_session_path
    end
  end
  
  def delivery_info
    
  end
  
  def payment_info
    
  end
  
end
