class AddLastLoginToUsersTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :last_login, :datetime
  end
end