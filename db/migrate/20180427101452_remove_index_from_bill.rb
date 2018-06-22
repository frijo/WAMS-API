class RemoveIndexFromBill < ActiveRecord::Migration[5.1]
  def change
  	remove_index :bill, name: "index_bills_on_bill_id"
  end
end
