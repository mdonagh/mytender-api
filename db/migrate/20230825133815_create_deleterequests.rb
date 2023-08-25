class CreateDeleterequests < ActiveRecord::Migration[6.1]
  def change
    create_table :deleterequests do |t|
      t.string :username
      t.string :comments

      t.timestamps
    end
  end
end
