class MakeBid
  def initialize(game, number_of_tricks, trump_suit)
    @game, @trump_suit = game, trump_suit
    @number_of_tricks = number_of_tricks.to_i
  end

  def call
    game.with_lock do
      return false if bidder_has_previously_passed? 
      return false unless bid_higher_than_previous_heighest_bid?

      game.events << new_event
    end

    true
  end

  private

  attr_reader :game, :number_of_tricks, :trump_suit

  # TODO Remove use of `player_seat`, this attribute is ignored
  def new_event 
    BidMade.new(event_args)
  end

  def event_args
    {
      number_of_tricks: number_of_tricks,
      trump_suit: trump_suit
    }
  end

  def bidder_has_previously_passed?
    game_state.bidder_has_previously_passed?
  end

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
