class Api::V1::SessionsController < ApplicationController

  def new
  end

  def create
    # find the user
    @user = User.find_by(username: params[:username])
    # if user exists and password is correct
    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def destroy
    session[:user_id] = nil
  end


end
