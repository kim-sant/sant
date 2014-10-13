if Rails.env.production?
  Stripe.api_key = "sk_live_jMGxWwNjm7VDwrvPVoo3ao3H"
  STRIPE_PUBLIC_KEY = "pk_live_pGPUxg1fb0bDwnGp8l0qq5XN"
else
  Stripe.api_key = "sk_test_nIWkMSHVjbPK2vMUiLoefkSS"
  STRIPE_PUBLIC_KEY = "pk_test_VOnra2r7QpSrnlj5K5Mt5nnD"
end