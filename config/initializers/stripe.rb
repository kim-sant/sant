if Rails.env.production?
  Stripe.api_key = ENV["STRIPE_API_KEY"]
  STRIPE_PUBLIC_KEY = ENV["STRIPE_PUBLIC_KEY"]
else
  Stripe.api_key = ENV["STRIPE_PUBLIC_KEY_TEST"]
  STRIPE_PUBLIC_KEY = ENV["STRIPE_API_KEY_TEST"]
end