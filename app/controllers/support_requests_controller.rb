class SupportRequestsController < InheritedResources::Base

  def create
    Product.create(params.require(:product).permit(:name, :price, :image, :slug))
    redirect_to root_url, notice: "Your support request has been received.  We will follow-up shortly."
  end

  private

    def support_request_params
      params.require(:support_request).permit(:name, :email, :message)
    end
end

