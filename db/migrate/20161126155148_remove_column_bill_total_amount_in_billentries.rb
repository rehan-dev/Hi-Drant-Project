class RemoveColumnBillTotalAmountInBillentries < ActiveRecord::Migration[5.0]
  def change
    remove_column :billentries, :bill_total_amount
  end
end
