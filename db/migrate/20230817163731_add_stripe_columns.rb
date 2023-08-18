class AddStripeColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscription_id, :string
    add_column :users, :customer_id, :string
  end
end
