class ProductsController < InheritedResources::Base
  
  def create
    Product.create(params.require(:product).permit(:name, :price, :image, :slug))
    redirect_to root_url
  end
  
  def show
    @product = Product.find_by_slug(params[:id])
  end
  
  def add_product_to_cart
    customer = current_user.customer
    product = Product.find(params[:product_id])
    if Cart.where(customer_id: customer.id).present?
      cart = Cart.where(customer_id: customer.id).first
    else
      cart = Cart.new
      cart.customer_id = customer.id
      cart.save
    end
    selection = CartSelection.new
    selection.cart_id = cart.id
    selection.product_id = product.id
    selection.quantity
    selection.save
    redirect_to root_url, notice: "Successfully added #{product.name} to cart."
  end
  
end
