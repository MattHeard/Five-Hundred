class GameState
  COMPLETE_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  attr_accessor :deck, :hands, :kitty, :dealer, :bidder, :bids

  # TODO Investigate using a service
  # Should this be extracted into a service for the sake of preventing GameState
  # from knowing anything about Event?
  # Or is it okay, considering that this is a class method rather than an object
  # method?
  # Or should this be collapsed into the #initialize method?
  def self.for(game)
    game.events.inject(GameState.new) do |state, event|
      event.apply(state)
      state
    end
  end

  def initialize
    @deck = COMPLETE_DECK.dup
    @hands = { :south => [ ], :west => [ ], :north => [ ], :east => [ ] }
    @kitty = [ ]
    @bids = { }
  end

  # NOTE: This currently only works because only bids of 6 Spades are accepted
  # and all subsequent bids of 6 Spades are rejected for not being high enough.
  # After other bids are accepted, this will need to actually find the max.
  def highest_bid
    @bids.values.reject { |bid| bid.nil? }.first
  end

  def bidder_has_previously_passed?
    @bidder.present? &&
      @bids[@bidder].present? &&
      @bids[@bidder][:bid_or_pass] == :pass
  end

  def bid_count
    @bids.values.count { |bid| bid.present? && bid[:bid_or_pass] == :bid }
  end

  def present(bid)
    "#{bid[:number_of_tricks]}#{bid[:trump_suit]}"
  end
end
