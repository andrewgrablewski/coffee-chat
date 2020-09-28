class AddChatroomIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :charoom_id, :int
  end
end
