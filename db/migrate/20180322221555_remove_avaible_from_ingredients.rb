class RemoveAvaibleFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :avaible, :string
  end
end
