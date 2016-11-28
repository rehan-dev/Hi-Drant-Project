class ChangeColumnRecoverableToReceivedAmountInCompanies < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :recoverable_amount, :received_amount
  end
end
