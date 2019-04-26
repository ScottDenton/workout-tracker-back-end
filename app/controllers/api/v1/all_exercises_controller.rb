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
    @exercise = Exercise.all.reverse.find{|exercise|  exercise.imported_id == params[:imported_id]}
    if @exercise
      render json: @exercise
    else
      render json: { errors: @exercise.errors.full_messages }
    end
  end

  def abs
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=10"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end

  def arms
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=8"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end

  def back
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=12"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end
  def calves
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=14"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end
  def chest
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=111"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end
  def legs
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=9"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end
  def shoulders
    url = "https://wger.de/api/v2/exercise/?status=2&language=2&category=13"
    headers={
      'Authorization': Rails.application.credentials.dig(:api_key)
    }
    response = HTTParty.get(url, headers: headers)
    @data= response.body
    render json: @data
  end
end
