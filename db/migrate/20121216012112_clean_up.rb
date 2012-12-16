class CleanUp < ActiveRecord::Migration
  def change
    drop_table :open_id_authentication_associations
    drop_table :open_id_authentication_nonces

    remove_column :users, :failed_attempts
    remove_column :users, :unlock_token
    remove_column :users, :locked_at
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :encrypted_password

    remove_column :users, :password
    remove_column :users, :password_confirmation

  end
end
