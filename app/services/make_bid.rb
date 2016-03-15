class MakeBid
  def initialize(game, number_of_tricks, trump_suit)
    @game, @number_of_tricks, @trump_suit = game, number_of_tricks.to_i, trump_suit
  end

  def call
    bidder = GameState.for(@game).bidder
    return false if bidder_has_previously_passed?
    return false unless bid_heigher_than_previous_heighest_bid?
    @game.with_lock do
      BidMade.create!(target_player: bidder,
                      number_of_tricks: @number_of_tricks,
                      trump_suit: @trump_suit,
                      game: @game)
    end

    true
  end

  private

  def bid_heigher_than_previous_heighest_bid?
    return true if no_previous_bids?

    bidder = GameState.for(@game).bidder
    current_bid = {
      bidder: bidder,
      number_of_tricks: @number_of_tricks,
      trump_suit: @trump_suit
    }

    highest_bid.nil? || current_bid[:number_of_tricks] > highest_bid[:number_of_tricks]
  end

  def no_previous_bids?
    GameState.for(@game).bid_count == 0
  end

  def highest_bid
    GameState.for(@game).highest_bid
  end

  def bidder_has_previously_passed?
    GameState.for(@game).bidder_has_previously_passed?
  end
end
