class PaymentMethod < ActiveRecord::Base
  
  attr_accessor :stripe_card_token
  
  def save_with_payment(user)
    if valid?
      customer = Stripe::Customer.create(description: user.email, plan: 1, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      self.profile_id = user.profile.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
end
