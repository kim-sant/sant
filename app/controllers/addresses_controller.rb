class AddressesController < InheritedResources::Base

  def address_update
    @address = Address.new(address_params)
    @address.customer_id = current_user.customer.id
    if @address.save
      redirect_to billing_step_path
    else
      flash[:alert] = "Please complete the required fields."
      redirect_to address_step_url
    end
  end
  
  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :line_1, :line_2, :city, :state, :zip, :default)
  end
  
end