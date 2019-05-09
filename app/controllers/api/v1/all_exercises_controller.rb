class Api::V1::AllExercisesController < ApplicationController

  def index
    url = "https://wger.de/api/v2/exercise/?language=2&status=2&limit=200"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end

  def find
    @exercise = Exercise.all.reverse.find{|exercise|  exercise.imported_exercise_id == params[:imported_exercise_id]}
    if @exercise
      render json: @exercise
    # else
    #   render json: { errors: @exercise.errors.full_messages }
    end
  end

  def userWorkouts
    @workouts = Workout.all.select{|workout| workout.user_id == params[:user_id]}
    render json: @workouts
  end

  def userExercises
    @exercises = Exercise.all.select{|exercise| exercise.user_id == params[:user_id].to_i}
    render json: @exercises
  end

  def exercisesByWorkout
    @exercises = Workout.find(params[:id]).exercises
    render json: @exercises
  end

end
