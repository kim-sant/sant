if Rails.env.production?
  Stripe.api_key = ENV["STRIPE_API_KEY"]
  STRIPE_PUBLIC_KEY = ENV["STRIPE_PUBLIC_KEY"]
else
  Stripe.api_key = "pk_test_VOnra2r7QpSrnlj5K5Mt5nnD"
  STRIPE_PUBLIC_KEY = "sk_test_nIWkMSHVjbPK2vMUiLoefkSS"
end