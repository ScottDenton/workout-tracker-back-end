class Api::V1::ExerciseController < ApplicationController
  before_action :find_exercise, only: [:getDescription, :destroy]

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

  def destroy
    @exercise.destroy
  end

  def getDescription
    @description = @exercise.imported_exercise.description
    @desc = Loofah.fragment(@description).scrub!(:strip)
    @safeDescription = {description: @desc.text}

    render json: @safeDescription
  end

  private

  def exercise_params
    params.permit(:user_id, :name, :description, :category, :muscles, :equipment, :imported_exercise_id, :date, :weight, :reps, :sets, :notes, :units)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

end
