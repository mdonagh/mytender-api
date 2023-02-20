class AddShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.references :user
      t.string :notes
      t.string :address
      t.boolean :recurring
      t.integer :duration
      t.datetime :start_time, index: true
      t.decimal :lat, precision: 10, scale: 2, index: true
      t.decimal :upccode, precision: 10, scale: 2, index: true
      t.timestamps
    end
  end
end
