class Payment

  STRIPE_KEY = "sk_test_51Ng6T9FkuyPevR8M7AmXZ3s9cCcrNgHSWEeOjjCMFOMnarZIUEbMwKOYbFTT9bbG6OJuhacivT3P3ljaOcd88uOm00Lyy6ItdN"
  STRIPE_PK = "pk_test_51Ng6T9FkuyPevR8MA9bhsHnJIGkbKihsHVmPK3Ps6zC3A8NKZPAnefhskAEhIckIZamAsnYSJW0uaK3V4sFm2HSS00lDuL6j1H"
  PRICE_ID = 'price_1NgTbKFkuyPevR8MqQTRraDO'

  attr_accessor :payment_intent, :ephemeral_key, :customer, :publishable_key

  def initialize(user)
    Stripe.api_key = STRIPE_KEY
      # Use an existing Customer ID if this is a returning customer
    customer = Stripe::Customer.create
    ephemeral_key = Stripe::EphemeralKey.create({
    customer: customer['id'],
    }, {stripe_version: '2023-08-16'})

      subscription = Stripe::Subscription.create(
        customer: customer['id'],
        items: [{
          price: PRICE_ID,
        }],
        billing_cycle_anchor: 1.month.from_now.to_i,
        payment_behavior: 'default_incomplete',
        payment_settings: {save_default_payment_method: 'on_subscription'},
        expand: ['latest_invoice.payment_intent']
      )

   @payment_intent = subscription.latest_invoice.payment_intent.client_secret
   @ephemeral_key = ephemeral_key['secret']
   @customer = customer['id']
   @publishable_key = STRIPE_PK

   user.update(subscription_id: subscription.id, customer_id: customer['id'])
  end


  def self.cancel_subscription(user)
    Stripe.api_key = STRIPE_KEY
    Stripe::Subscription.cancel(user.subscription_id)
  end
end
