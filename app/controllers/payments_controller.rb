class PaymentsController < ApplicationController
  def sheet
    payment = Payment.new(context[:user])
    result = {
      paymentIntent: payment.payment_intent,
      ephemeralKey: payment.ephemeral_key,
      customer: payment.customer,
      publishableKey: payment.publishable_key
    }.to_json

    render json: result
  end

  def context
    { user: current_user }
  end
end
