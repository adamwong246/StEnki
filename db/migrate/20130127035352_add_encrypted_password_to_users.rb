class AddEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string
    add_column :users, :password, :string
  end
end
