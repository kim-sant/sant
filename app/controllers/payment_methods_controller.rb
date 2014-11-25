class PaymentMethodsController < InheritedResources::Base
  
  def new
    if !user_signed_in?
      redirect_to root_url, alert: "Please create an account or sign-in."
    else
      @payment_method = PaymentMethod.new
    end
  end
  
  def create
    @payment_method = PaymentMethod.new(payment_method_params)
    user = current_user
    if @payment_method.save_with_payment(user)
      redirect_to @payment_method, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end
  
  def billing_update
    @payment_method = PaymentMethod.new(payment_method_params)
    user = current_user
    if @payment_method.save_with_payment(user)
      redirect_to review_step_path, :notice => "Your payment information has been saved."
    else
      render :billing_step
    end
  end
  
  private

  def payment_method_params
    params.require(:payment_method).permit(:stripe_customer_token, :last_4_digits, :customer_id, :stripe_card_token)
  end
  
end
