class GamesController < ApplicationController

  def index
    render json: Game.all.to_json
  end

  def create
    game = Game.create(name: params[:name])
    unless game.new_record?
      render json: game
    else
      render json: {error: 'error while creating game'}, status: 301
    end
  end

  def show
    game = Game.where(id: params[:id]).first
    if game.present?
      render json: {game: game, players: game.avatars}
    else
      render json: {error: 'error while creating game'}, status: 301
    end
  end
end
