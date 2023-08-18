class AddStripeColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :payment_intent_id, :string
    add_column :users, :customer_id, :string
  end
end
