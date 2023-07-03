class AddBytes < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :bytes, :integer
  end
end
