class ChangeDateFormatInTrucks < ActiveRecord::Migration[5.0]
  def change
    change_column :trucks, :day_off, :string
    change_column :trucks, :day_start, :string
  end
end
