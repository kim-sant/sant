class SupportRequestsController < InheritedResources::Base

  def create
    SupportRequest.create(params.require(:support_request).permit(:name, :email, :message))
    redirect_to root_url, notice: "Your support request has been received.  We will follow-up shortly."
  end

  private

    def support_request_params
      params.require(:support_request).permit(:name, :email, :message)
    end
end

