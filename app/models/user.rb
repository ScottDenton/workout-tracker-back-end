class User < ApplicationRecord
  has_many :exercises
  has_many :workouts
  has_many :workout_exercises, through: :workouts

  has_secure_password
end
