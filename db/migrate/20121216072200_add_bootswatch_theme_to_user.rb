class AddBootswatchThemeToUser < ActiveRecord::Migration
  def change
    add_column :users, :bootswatch_theme, :string
  end
end
