class AddCash < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :venmo, :string
    add_column :users, :cashapp, :string
    add_column :users, :instagram, :string
  end
end
