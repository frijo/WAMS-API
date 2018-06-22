class CreateBillMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_meals do |t|
      t.references :meal, foreign_key: true
      t.references :user, foreign_key: true
      t.float :quantity
      t.float :total

      t.timestamps
    end
  end
end
