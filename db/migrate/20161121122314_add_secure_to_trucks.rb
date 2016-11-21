class AddSecureToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :secure, :boolean
  end
end
