class CreateInvoiceNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_numbers do |t|
      t.integer :invoice_number
      t.integer :next_invoice_number

      t.timestamps
    end
  end
end
