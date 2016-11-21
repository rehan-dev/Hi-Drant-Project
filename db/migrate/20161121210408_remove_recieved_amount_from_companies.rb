class RemoveRecievedAmountFromCompanies < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :received_amount
  end
end
