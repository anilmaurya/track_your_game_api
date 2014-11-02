class UsersController < ApplicationController
  
  def login
    user = User.where("(username = ? OR number = ?) AND (password = ?)", params[:username], params[:username], params[:password])
               .first
    if user.present?
      render json: user
    else
      render json: [{:error => 'failure'}], status: 304
    end
  end

  def signup
    user = User.create(user_params)
    unless user.new_record?
      render json: user
    else
      render json: user.errors.messages, status: 304
    end
  end

  def user_params
    params.permit(:username, :number, :password)
  end
end
