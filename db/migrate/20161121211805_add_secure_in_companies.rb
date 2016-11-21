class AddSecureInCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :secure, :boolean
  end
end
