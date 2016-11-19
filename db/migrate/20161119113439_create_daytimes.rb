class CreateDaytimes < ActiveRecord::Migration[5.0]
  def change
    create_table :daytimes do |t|
      t.time :day_start
      t.time :day_off
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
