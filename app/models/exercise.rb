class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :imported_exercise
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end
