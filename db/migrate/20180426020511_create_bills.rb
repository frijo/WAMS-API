class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.integer :invoice_number
      t.datetime :invoice_date
      t.string :client_name
      t.string :client_phone
      t.float :sale_tax
      t.float :total_tax
      t.string :payment_type

      t.timestamps
    end
  end
end
