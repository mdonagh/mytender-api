class Payment

  STRIPE_KEY = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
  STRIPE_PK = "pk_test_TYooMQauvdEDq54NiTphI7jx"

  attr_accessor :payment_intent, :ephemeral_key, :customer, :publishable_key

  def initialize(user)
    Stripe.api_key = STRIPE_KEY
      # Use an existing Customer ID if this is a returning customer
      customer = Stripe::Customer.create
      ephemeral_key = Stripe::EphemeralKey.create({
        customer: customer['id'],
      }, {stripe_version: '2023-08-16'})
      payment_intent = Stripe::PaymentIntent.create({
        amount: 1099,
        currency: 'usd',
        customer: customer['id'],
        # In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
        automatic_payment_methods: {
          enabled: true,
        }
      })

   @payment_intent = payment_intent['client_secret']
   @ephemeral_key = ephemeral_key['secret']
   @customer = customer['id']
   @publishable_key = STRIPE_PK

   user.update(payment_intent_id: @payment_intent, customer_id: customer['id'])
   ap @payment_intent
   ap @ephemeral_key
   ap @customer
   ap @publishable_key
  end
end
