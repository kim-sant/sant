class ProductsController < InheritedResources::Base
  
  def create
    Product.create(params.require(:product).permit(:name, :price, :image))
    redirect_to root_url
  end
  
end
