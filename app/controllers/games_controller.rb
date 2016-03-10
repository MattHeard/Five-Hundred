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
    @game = Game.find(params[:id])
    @game_state = GameState.for(@game)
  end

  def update
    game = Game.find(update_params[:id])

    PassBid.new(game).call if update_params[:bid_or_pass] == "Pass"

    redirect_to game
  end

  private

  def update_params
    params.permit(:id, :bid_or_pass)
  end
end
