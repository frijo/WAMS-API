class AddSatusToMeal < ActiveRecord::Migration[5.1]
  def change
  	add_column :meals, :status, :string
  end
end
