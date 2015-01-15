class SupportRequestsController < InheritedResources::Base

  def create
    support_request = SupportRequest.create(params.require(:support_request).permit(:name, :email, :message))
    UserMailer.support_request(support_request)
    redirect_to root_url, notice: "Your support request has been received.  We will follow-up shortly."
  end

  private

    def support_request_params
      params.require(:support_request).permit(:name, :email, :message)
    end
end

