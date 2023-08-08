class AddSeededToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :seeded, :boolean
  end
end
