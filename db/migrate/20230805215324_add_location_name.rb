class AddLocationName < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :bar_name, :string
  end
end
