class CreateReceivables < ActiveRecord::Migration[5.0]
  def change
    create_table :receivables do |t|
      t.integer :company_id
      t.decimal :receiveable_amount, precision: 20, scale: 2
      t.date :check_date
      t.date :transaction_date
      t.text :remarks

      t.timestamps
    end
  end
end
