class ChangeColumnTypeAndNameInBillentries < ActiveRecord::Migration[5.0]
  def change
    # remove_column :billentries, :company_name
    # add company_id replace with company_name
    add_column :billentries, :company_id, :int
  end
end
