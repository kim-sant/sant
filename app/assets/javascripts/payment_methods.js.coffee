jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()

payment_method =
  setupForm: ->
    $('#new_payment_method').submit ->
      $('input[type=submit]').prop('disabled', true)
      if $('#card_number').length
        payment_method.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment_method.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#payment_method_stripe_card_token').val(response.id)
      $('#new_payment_method')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').prop('disabled', false)