class CreateImportedExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :imported_exercises do |t|
      t.integer :imported_id
      t.string :name
      t.string :description
      t.integer :category
      t.text :muscles, array: true, default: []
      t.text :equipment, array: true, default: []
    end
  end
end
