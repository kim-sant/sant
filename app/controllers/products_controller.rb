class ProductsController < InheritedResources::Base
  
  def create
    Product.create(params.require(:product).permit(:name, :price, :image, :slug))
    redirect_to root_url
  end
  
  def show
    @product = Product.find_by_slug(params[:id])
  end
  
end
