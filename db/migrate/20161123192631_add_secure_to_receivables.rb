class AddSecureToReceivables < ActiveRecord::Migration[5.0]
  def change
    add_column :receivables, :secure, :boolean
  end
end
