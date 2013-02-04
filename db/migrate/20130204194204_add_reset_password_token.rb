class AddResetPasswordToken < ActiveRecord::Migration
  def change
    add_column :users, :user_password_token, :string
  end
end
