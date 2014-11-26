class CustomersController < InheritedResources::Base
  
  def show
    user = current_user
    if user.present? && user.customer.address.present?
      @customer = current_user.customer
      @address = @customer.address
    else
      redirect_to root_url
    end
  end
  
end
