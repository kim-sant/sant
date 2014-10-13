if Rails.env.production?
  Stripe.api_key = "sk_live_jMGxWwNjm7VDwrvPVoo3ao3H",
  STRIPE_PUBLIC_KEY = "pk_live_pGPUxg1fb0bDwnGp8l0qq5XN"
else
  Stripe.api_key = "sk_test_nIWkMSHVjbPK2vMUiLoefkSS",
  STRIPE_PUBLIC_KEY = "pk_test_VOnra2r7QpSrnlj5K5Mt5nnD"
end

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => "sk_live_jMGxWwNjm7VDwrvPVoo3ao3H",
    :secret_key      => "pk_live_pGPUxg1fb0bDwnGp8l0qq5XN"
  }
else
  Rails.configuration.stripe = {
    :publishable_key => "sk_test_nIWkMSHVjbPK2vMUiLoefkSS",
    :secret_key      => "pk_test_VOnra2r7QpSrnlj5K5Mt5nnD"
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]