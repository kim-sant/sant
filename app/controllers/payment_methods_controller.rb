class PaymentMethodsController < InheritedResources::Base
  
  def new
    if !user_signed_in?
      redirect_to root_url, alert: "Please create an account or sign-in."
    else
      @payment_method = PaymentMethod.new
    end
  end
  
end
