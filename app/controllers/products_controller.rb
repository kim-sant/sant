class ProductsController < InheritedResources::Base
  
  def create
    Product.create(params.require(:product).permit(:name, :price, :image, :slug))
    redirect_to root_url
  end
  
  def show
    @product = Product.find_by_slug(params[:id])
  end
  
  def index
    @products = Product.all
    @subscription_plans = SubscriptionPlan.all
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
      elsif @customer.cart.present?
        @cart = @customer.cart
      else
        @cart = Cart.create
        if !@customer.subscriptions.where(active: true).present?
          selection = CartSelection.new
          selection.cart_id = @cart.id
          selection.subscription_plan_id = SubscriptionPlan.first.id
          selection.quantity = 1
          selection.save
        end
      end
    elsif session[:cart_id].present? && Cart.where(id: session[:cart_id]).present?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      selection = CartSelection.new
      selection.cart_id = @cart.id
      selection.subscription_plan_id = SubscriptionPlan.first.id
      selection.quantity = 1
      selection.save
    end
  end
  
  def add_product_to_cart
    product = Product.find(params[:product_id])
    if user_signed_in?
      customer = current_user.customer
      cart = customer.cart
    else
      if session[:cart_id].present? && Cart.where(id: session[:cart_id]).present?
        cart = Cart.find(session[:cart_id])
      else
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end
    selection = CartSelection.new
    selection.cart_id = cart.id
    selection.product_id = product.id
    selection.quantity = 1
    selection.save
    redirect_to products_url
  end
  
  def add_plan_to_cart 
    plan = SubscriptionPlan.find(params[:plan_id])
    if user_signed_in?
      customer = current_user.customer
      cart = customer.cart
    else
      if session[:cart_id].present? && Cart.where(id: session[:cart_id]).present?
        cart = Cart.find(session[:cart_id])
      else
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end
    selection = CartSelection.new
    selection.cart_id = cart.id
    selection.subscription_plan_id = plan.id
    selection.quantity = 1
    selection.save
    redirect_to products_url
  end
  
  def remove_plan_from_cart
    plan = SubscriptionPlan.find(params[:plan_id])
    if user_signed_in?
      customer = current_user.customer
      cart = customer.cart
    else
      if session[:cart_id].present? && Cart.where(id: session[:cart_id]).present?
        cart = Cart.find(session[:cart_id])
      end
    end
    selection = CartSelection.where(cart_id: cart.id).where(subscription_plan_id: plan.id).first
    selection.destroy
    redirect_to products_url
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end
  
end
