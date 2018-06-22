class AddBillToBillMeals < ActiveRecord::Migration[5.1]
  def change
  	remove_column :bill_meals, :bill_id, :integer
    add_reference :bill_meals, :bill, foreign_key: true
    #add_reference :bill_meals, :bill, index: true
    #add_index :bill_meals,:bill_id, index: true 
  end
end
