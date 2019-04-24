class Api::V1::ExerciseController < ApplicationController
  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def create
    @exercise = Exercise.create(exercise_params)
    render json: @exercise
  end

  def update
    @exercise.update(exercise_params)
    if @exercise.save
      render json: @exercise, status: :accepted
    else
      render json: { errors: @exercise.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def exercise_params
    params.permit(:user_id, :name, :description, :category, :muscles, :equipment, :imported_id, :date, :weight, :reps, :sets, :notes)
  end

  def find_exercise
    @exercise = Workout.find(params[:id])
  end

end
