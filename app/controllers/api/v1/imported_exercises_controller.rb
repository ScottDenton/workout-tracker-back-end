class Api::V1::ImportedExercisesController < ApplicationController

  def index
    @imported_exercises = ImportedExercise.all
    render json: @imported_exercises
  end

  def create
    @imported_exercises = ImportedExercise.create(imported_exercises_params)
    render json: @imported_exercises
  end

  private

  def imported_exercises_params
    params.permit(:imported_exercise_id, :name, :description, :category, :muscles, :equipment)
  end

end
