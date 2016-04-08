require 'pp'

class MakeBid
  attr_reader :game, :number_of_tricks, :trump_suit

  def initialize(game, number_of_tricks, trump_suit)
    @game, @number_of_tricks, @trump_suit = game, number_of_tricks.to_i, trump_suit
  end

  # TODO Move game state queries into locked block
  def call
    return false if game_state.bidder_has_previously_passed?
    return false unless bid_higher_than_previous_heighest_bid?
    game.with_lock { create_event }

    true
  end

  # TODO Remove use of `player_seat`, this attribute is ignored
  def create_event
    BidMade.create!(player_seat: game_state.current_player_seat,
                    number_of_tricks: number_of_tricks,
                    trump_suit: trump_suit,
                    game: game)
  end

  private

  def bid_higher_than_previous_heighest_bid?
    bid > game_state.highest_bid
  end

  def bid
    Bid.new(number_of_tricks: number_of_tricks, trump_suit: trump_suit)
  end

  def game_state
    CreateGameState.new(game).call
  end
end
