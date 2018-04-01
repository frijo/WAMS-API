class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit_type
      t.string :avaible
      t.float :quantity
      t.float :cost_price

      t.timestamps
    end
  end
end
