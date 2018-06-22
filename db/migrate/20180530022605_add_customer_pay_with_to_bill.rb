class AddCustomerPayWithToBill < ActiveRecord::Migration[5.1]
  def change
  	   add_column :bills, :customer_pay_with, :float
  end
end
