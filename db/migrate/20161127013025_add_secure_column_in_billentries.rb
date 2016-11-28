class AddSecureColumnInBillentries < ActiveRecord::Migration[5.0]
  def change
    add_column :billentries, :secure, :boolean
  end
end
