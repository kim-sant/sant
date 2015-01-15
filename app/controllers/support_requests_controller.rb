class SupportRequestsController < InheritedResources::Base

  private

    def support_request_params
      params.require(:support_request).permit(:name, :email, :message)
    end
end

