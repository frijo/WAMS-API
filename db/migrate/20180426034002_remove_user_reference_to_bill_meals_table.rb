class RemoveUserReferenceToBillMealsTable < ActiveRecord::Migration[5.1]
  def change
  	
  	remove_index :bill_meals, name: "index_bill_meals_on_user_id"
  	remove_column :bill_meals, :user_id, :integer
  end
end
