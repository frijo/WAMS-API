class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :meal_type
      t.string :image
      t.float :meal_cost
      t.float :sell_price
      t.text :recipe_description

      t.timestamps
    end
  end
end
