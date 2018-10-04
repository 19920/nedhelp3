class DropMessagesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :messages
    drop_table :conversations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
