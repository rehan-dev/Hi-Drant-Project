class CreateBillentries < ActiveRecord::Migration[5.0]
  def change
    create_table :billentries do |t|
      t.string :truck_no
      t.string :company_name
      t.string :address
      t.datetime :time_arrive
      t.datetime :time_departure
      t.date :current_date
      t.decimal :supply_rate
      t.decimal :weight
      t.decimal :previous_amount
      t.decimal :current_total_amount
      t.decimal :recieved_amount
      t.decimal :net_balance
      t.decimal :total_amount

      t.timestamps
    end
  end
end
