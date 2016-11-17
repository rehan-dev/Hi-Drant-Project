class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :company_address
      t.string :contact_no
      t.string :company_reference
      t.decimal :previous_amount
      t.decimal :net_balance
      t.decimal :received_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
