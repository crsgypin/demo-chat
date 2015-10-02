class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
    	t.string :content
    	t.string :username
    	t.integer :chat_room_id, :index =>true
      t.timestamps null: false
    end
  end
end
