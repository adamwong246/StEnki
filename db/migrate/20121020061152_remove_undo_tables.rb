class RemoveUndoTables < ActiveRecord::Migration
  def up
    drop_table "undo_items"
  end

  def down
    create_table "undo_items" do |t|
      t.string   "type",       :null => false
      t.datetime "created_at", :null => false
      t.text     "data"
    end

    add_index "undo_items", ["created_at"], :name => "index_undo_items_on_created_at"
  end
end
