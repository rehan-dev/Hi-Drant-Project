class AddReceivedAmountInBillentries < ActiveRecord::Migration[5.0]
  def change
    add_column :billentries, :received_amount, :decimal, precision: 20, scale: 2
  end
end
