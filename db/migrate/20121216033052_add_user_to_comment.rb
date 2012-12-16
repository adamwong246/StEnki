class AddUserToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :author
    remove_column :comments, :author_url
    remove_column :comments, :author_email
  end
end
