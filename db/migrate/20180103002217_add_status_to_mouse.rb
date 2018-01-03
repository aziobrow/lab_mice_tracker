class AddStatusToMouse < ActiveRecord::Migration[5.1]
  def change
    add_column :mice, :status, :integer
  end
end
