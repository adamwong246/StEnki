class DropPagesTable < ActiveRecord::Migration
  def up
    drop_table "pages"
  end

  def down
    create_table "pages" do |t|
      t.string   "title",      :null => false
      t.string   "slug",       :null => false
      t.text     "body",       :null => false
      t.text     "body_html",  :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
