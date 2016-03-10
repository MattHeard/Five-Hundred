class GameState
  COMPLETE_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  attr_accessor :deck
  attr_accessor :hands
  attr_accessor :kitty
  attr_accessor :dealer
  attr_accessor :bidder

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
  end
end
