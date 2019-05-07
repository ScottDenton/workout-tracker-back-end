class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :exercises, :imported_id, :imported_exercise_id
  end
end
