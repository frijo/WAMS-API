class AddAvaibleFromIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :avaible, :float
  end
end
