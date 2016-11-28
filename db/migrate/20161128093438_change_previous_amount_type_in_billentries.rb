class ChangePreviousAmountTypeInBillentries < ActiveRecord::Migration[5.0]
  def change
    change_column :billentries, :previous_balance, :decimal, precision: 20, scale: 2
  end
end
