class RenameGroupToGroupNumber < ActiveRecord::Migration[5.1]
  def change
    rename_column :mice, :group, :group_number
  end
end
