class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.datetime :order_date
      t.string :client_name
      t.string :client_phone
      t.float :sales_taxes
      t.float :total_tax
      t.string :payment_type

      t.timestamps
    end
  end
end
