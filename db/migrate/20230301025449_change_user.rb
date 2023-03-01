class ChangeUser < ActiveRecord::Migration[6.1]
  def change
    safety_assured { remove_column :users, :first_name }
    safety_assured { remove_column :users, :last_name }
  end
end

