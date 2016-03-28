class MakeBid
  attr_reader :game, :number_of_tricks, :trump_suit

  def initialize(game, number_of_tricks, trump_suit)
    @game, @number_of_tricks, @trump_suit = game, number_of_tricks.to_i, trump_suit
  end

  def call
    return false if game_state.bidder_has_previously_passed?
    return false unless bid_heigher_than_previous_heighest_bid?
    game.with_lock { create_event }

    true
  end

  def create_event
    BidMade.create!(target_player: game_state.bidder,
                    number_of_tricks: number_of_tricks,
                    trump_suit: trump_suit,
                    game: game)
  end

  private

  def bid_heigher_than_previous_heighest_bid?
    game_state.bid_count == 0 ||
      game_state.highest_bid.nil? ||
      number_of_tricks > game_state.highest_bid[:number_of_tricks]
  end

  def game_state
    CreateGameState.new(game).call
  end
end
