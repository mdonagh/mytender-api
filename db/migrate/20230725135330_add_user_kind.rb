class AddUserKind < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kind, :integer
  end
end
