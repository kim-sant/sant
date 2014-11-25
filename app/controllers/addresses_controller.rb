class AddressesController < InheritedResources::Base

  def address_update
    @address = Address.new(address_params)
    if @address.save
      redirect_to billing_step_path
    else
      flash[:alert] = "Please complete the required fields."
      redirect_to address_step_url
    end
  end
  
  private

  def address_params
    params.require(:address).permit(:line_1, :line_2, :city, :state, :zip)
  end
  
end