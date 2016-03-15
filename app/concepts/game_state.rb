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

  def highest_bid
    present(unpresented_highest_bid)
  end

  # TODO Refactor
  def unpresented_highest_bid
    @bids.values.reject { |bid| bid.nil? }.max { |first, second| compare(first, second) }
  end

  def bidder_has_previously_passed?
    @bidder.present? && @bids[@bidder].present? && @bids[@bidder][:bid_or_pass] == :pass
  end

  def bid_count
    @bids.values.count { |bid| bid.present? && bid[:bid_or_pass] == :bid }
  end

  private

  # TODO Implement me
  def compare(first, second)
    0
  end

  def present(bid)
    "#{bid[:number_of_tricks]}#{bid[:trump_suit]}"
  end
end
