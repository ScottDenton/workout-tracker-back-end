class Api::V1::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def create
    @workout = Workout.create(workout_params)
    render json: @workout
  end

  def update
    @workout.update(workout_params)
    if @workout.save
      render json: @workout, status: :accepted
    else
      render json: { errors: @workout.errors.full_messages }, status: :unprocessible_entity 
    end
  end

  private

  def workout_params
    params.permit(:user_id, :name, :date)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
