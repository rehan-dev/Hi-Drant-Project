class AddTruckOwnerToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :truck_owner, :string
  end
end
