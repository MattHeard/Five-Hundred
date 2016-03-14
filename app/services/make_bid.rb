class MakeBid
  def initialize(game, number_of_tricks, trump_suit)
    @game, @number_of_tricks, @trump_suit = game, number_of_tricks, trump_suit
  end

  def call
    bidder = GameState.for(@game).bidder
    return false unless bid_heigher_than_previous_heighest_bid
    @game.with_lock do
      BidMade.create!(target_player: bidder,
                      number_of_tricks: @number_of_tricks,
                      trump_suit: @trump_suit,
                      game: @game)
    end
  end

  private

  def bid_heigher_than_previous_heighest_bid
    bidder = GameState.for(@game).bidder
    current_bid = {
      bidder: bidder,
      number_of_tricks: @number_of_tricks,
      trump_suit: @trump_suit
    }

    highest_bid.nil? || current_bid[:number_of_tricks] > highest_bid[:number_of_tricks]
  end

  def highest_bid
    GameState.for(@game).unpresented_highest_bid
  end
end
