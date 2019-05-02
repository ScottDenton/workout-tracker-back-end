class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :show, :edit]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def edit
    @updated_user = @user.update(user_params)
    if @updated_user
      render json: @updated_user
    else
      render json: { errors: @updated_user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :date_of_birth, :height, :weight, :units)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
