class AddUserReferenceToBillsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :bills, :user_id, :integer
    add_index :bills, :user_id
  end
end
