class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.float :quantity
      t.references :ingredient, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
