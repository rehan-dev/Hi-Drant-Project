class AddBillNoInReceivables < ActiveRecord::Migration[5.0]
  def change
    add_column :receivables, :bill_no , :int
  end
end
