class AddCancellationReason < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cancellation_reason, :string
  end
end
