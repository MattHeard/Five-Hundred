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

  # TODO Refactor logic out of controller
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

  # TODO Refactor into RESTful resource
  def play_card
    strong_params = params.permit(:id, :card, :player)
    game = Game.find(strong_params[:id])
    card = strong_params[:card]
    player = strong_params[:player].to_sym
    PlayCard.new(game, player, card).call

    redirect_to game
  end

  # TODO Refactor into RESTful resource
  def start_next_trick
    strong_params = params.permit(:id)
    game = Game.find(strong_params[:id])
    StartNextTrick.new(game).call

    redirect_to game
  end

  def start_next_round
    strong_params = params.permit(:id)
    game = Game.find(strong_params[:id])
    StartNextRound.new(game).call

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
