class RemoveTrashFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :fullname

  end
end
