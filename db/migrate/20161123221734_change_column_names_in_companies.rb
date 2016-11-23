class ChangeColumnNamesInCompanies < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :current_balance, :recoverable_amount
    rename_column :companies, :previous_amount, :total_bill_amount
  end
end
