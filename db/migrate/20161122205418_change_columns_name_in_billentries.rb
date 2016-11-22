class ChangeColumnsNameInBillentries < ActiveRecord::Migration[5.0]
  def change
    # rename_column :billentries, :weight, :capacity
    # rename_column :billentries, :current_total_amount, :bill_total_amount
    # rename_column :billentries, :previous_amount, :previous_balance
    #remove received & net balance
    remove_column :billentries, :recieved_amount
    remove_column :billentries, :net_balance
  end
end
