jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  listing.setupForm()

listing =
  setupForm: ->
    $('#new_listing').submit ->
      if $('input').length > 6
        $('input[type=submit]').attr('disabled', true)
        Stripe.bankAccount.createToken($('#new_listing'), listing.handleStripeResponse)
        false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_listing').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_listing')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)
