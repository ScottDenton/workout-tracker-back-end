class CreateImportedExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :imported_exercises do |t|
      t.integer :imported_id
      t.string :name
      t.string :description
      t.integer :category
      t.integer :muscles, array: true, default: []
      t.integer :equipment, array: true, default: []
    end
  end
end
