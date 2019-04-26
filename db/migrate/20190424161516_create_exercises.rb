class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.string :name
      t.integer :imported_id
      t.date :date
      t.integer :weight
      t.integer :reps
      t.integer :sets
      t.text :notes

      t.timestamps
    end
  end
end
