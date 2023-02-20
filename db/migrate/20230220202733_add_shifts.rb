class AddShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.references :user
      t.string :notes
      t.string :address
      t.boolean :recurring
      t.integer :duration
      t.datetime :start_time
      t.decimal :latitude, precision: 10, scale: 2
      t.decimal :longitude, precision: 10, scale: 2
      t.timestamps
    end

    add_index(:shifts, [:latitude, :longitude, :start_time])

  end
end
