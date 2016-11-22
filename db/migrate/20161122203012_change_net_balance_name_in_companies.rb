class ChangeNetBalanceNameInCompanies < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :net_balance, :current_balance
  end
end
