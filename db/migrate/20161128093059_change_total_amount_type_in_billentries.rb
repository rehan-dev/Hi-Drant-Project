class ChangeTotalAmountTypeInBillentries < ActiveRecord::Migration[5.0]
  def change
    change_column :billentries, :total_amount, :decimal, precision: 20, scale: 2
  end
end
