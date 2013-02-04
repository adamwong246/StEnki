class AddExperimentalModeToUser < ActiveRecord::Migration
  def change
    add_column :users, :experimental_mode, :boolean
  end
end
