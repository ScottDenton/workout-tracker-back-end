class User < ApplicationRecord
  has_many :exercises
  has_many :workouts
  has_many :workout_exercises, through: :workouts
  validates :username, presence: true, uniqueness: true

  has_secure_password
end
