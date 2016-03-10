require 'pp'

class GamesController < ApplicationController
  def index
  end

  def create
    game = Game.create!
    DealAllCards.new(game).call
    ChangeDealer.new(game).call

    redirect_to game
  end

  def show
    game = Game.find(params[:id])
    @game_state = GameState.for(game)
    pp @game_state
  end
end
