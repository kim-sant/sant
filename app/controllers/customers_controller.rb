class CustomersController < InheritedResources::Base
  
  def show
    if !current_user.present?
      redirect_to root_url
    else
      @profile = current_user.customer
    end
  end
  
end
