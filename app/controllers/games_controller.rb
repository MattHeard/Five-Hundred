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
    @game_state = CreateGameState.new(@game).call
  end

  def bid
    bid_params = params.permit(:id, :bid_or_pass, :number_of_tricks, :trump_suit)
    game = Game.find(bid_params[:id])
    if bidder_has_passed?(bid_params)
      PassBid.new(game).call
    elsif bidder_has_made_bid?(bid_params)
      MakeBid.new(game, bid_params[:number_of_tricks], bid_params[:trump_suit]).call
    end

    redirect_to game
  end

  private

  def bidder_has_passed?(params)
    params[:bid_or_pass] == "Pass"
  end

  def bidder_has_made_bid?(params)
    params[:bid_or_pass] == "Bid"
  end
end
