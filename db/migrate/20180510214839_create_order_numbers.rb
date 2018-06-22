class CreateOrderNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_numbers do |t|
      t.integer :order_number
      t.integer :next_order_number

      t.timestamps
    end
  end
end
