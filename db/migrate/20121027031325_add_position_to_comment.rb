class AddPositionToComment < ActiveRecord::Migration
  def change
    add_column :comments, :position, :integer
  end
end
