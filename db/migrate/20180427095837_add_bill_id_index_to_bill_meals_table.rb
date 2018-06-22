class AddBillIdIndexToBillMealsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :bill_meals, :bill_id, :integer
    add_index :bills, :bill_id
  end
end
