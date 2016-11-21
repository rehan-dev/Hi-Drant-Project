class ChangeAmountColumnInCompanies < ActiveRecord::Migration[5.0]
  def change
    change_column :companies, :previous_amount, :decimal, precision: 10, scale: 2
    change_column :companies, :received_amount, :decimal, precision: 10, scale: 2
    change_column :companies, :net_balance, :decimal, precision: 10, scale: 2
  end
end
