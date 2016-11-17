class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string :truck_no
      t.string :truck_driver
      t.string :driver_no
      t.datetime :day_start
      t.datetime :day_off
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
