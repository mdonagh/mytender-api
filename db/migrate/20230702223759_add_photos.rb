class AddPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.references :user
      t.integer :kind
      t.datetime :created_at,   null: false
    end
  end
end
