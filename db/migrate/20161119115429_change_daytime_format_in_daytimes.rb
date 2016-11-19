class ChangeDaytimeFormatInDaytimes < ActiveRecord::Migration[5.0]
  def change
    change_column :daytimes, :day_off, :string
    change_column :daytimes, :day_start, :string
  end
end
