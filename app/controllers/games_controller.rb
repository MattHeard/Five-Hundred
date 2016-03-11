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

    if bidder_has_passed?
      PassBid.new(game).call
    elsif bidder_has_made_bid?
      MakeBid.new(game, number_of_tricks, trump_suit).call
    end

    redirect_to game
  end

  private

  def update_params
    params.permit(:id, :bid_or_pass, :number_of_tricks, :trump_suit)
  end

  def bidder_has_passed?
    update_params[:bid_or_pass] == "Pass"
  end

  def bidder_has_made_bid?
    update_params[:bid_or_pass] == "Bid"
  end

  def number_of_tricks
    update_params[:number_of_tricks]
  end

  def trump_suit
    update_params[:trump_suit]
  end
end
