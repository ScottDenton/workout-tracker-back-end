class Api::V1::ExerciseController < ApplicationController
  before_action :find_exercise, only: [:getDescription, :getImageUrl]

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

  def getDescription
    @description = @exercise.imported_exercise.description
    @desc = Loofah.fragment(@description).scrub!(:strip)
    @safeDescription = {description: @desc.text}

    render json: @safeDescription
  end

  def getImageUrl
    url = "https://wger.de/api/v2/exerciseimage/#{@exercise.imported_exercise.imported_id}"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data

  end

  private

  def exercise_params
    params.permit(:user_id, :name, :description, :category, :muscles, :equipment, :imported_exercise_id, :date, :weight, :reps, :sets, :notes, :units)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

end
