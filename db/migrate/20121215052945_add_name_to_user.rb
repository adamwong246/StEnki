class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :remember_me, :boolean
    add_column :users, :fullname, :string
    add_column :users, :shortbio, :string
    add_column :users, :weburl, :string
  end
end
