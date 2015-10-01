class AddUserNameOnMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :username, :string
  end
end
