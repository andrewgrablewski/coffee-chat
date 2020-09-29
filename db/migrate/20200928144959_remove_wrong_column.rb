class RemoveWrongColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :charoom_id
  end
end
