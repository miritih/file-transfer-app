class RenameMediaFileNameToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :media_files, :name, :description
  end
end
