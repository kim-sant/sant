class SupportRequestsController < InheritedResources::Base

  def create
    @support_request = SupportRequest.new(params[:support_request_params])

    if @support_request.save
      redirect_to root_url, notice: "Your support request has been received.  We will follow-up shortly."
    else
      render action: "new"
    end
  end

  private

    def support_request_params
      params.require(:support_request).permit(:name, :email, :message)
    end
end

