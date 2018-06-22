class CreateOrderMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :order_meals do |t|
      t.references :meal, foreign_key: true
      t.references :order, foreign_key: true
      t.float :quantity
      t.float :total

      t.timestamps
    end
  end
end
