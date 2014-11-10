class PlayersController < ApplicationController
  
  def create
    user = User.where(number: params['number']).first
    attrs = {number: params['number'], game_id: params['game_id']}
    attrs.merge!({user_id: user.id}) if user.present?
    avatar = Avatar.create(attrs)
    unless avatar.new_record?
      render json: avatar
    else
      render json: {error: 'error while adding player'}, status: 301
    end
  end
end
