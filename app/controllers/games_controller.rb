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
end
