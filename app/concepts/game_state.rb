class GameState
  COMPLETE_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  attr_reader :deck

  def self.for(game)
    game.events.inject(GameState.new) do |state, event|
      event.apply(state)
      state
    end
  end

  def initialize
    @deck = COMPLETE_DECK.dup
    @hands = { :south => [ ], :west => [ ] }
  end

  def remove_from_deck(card)
    @deck.delete(card)
  end

  def add_to_the_southern_hand(card)
    @hands[:south] << card
  end

  def add_to_the_western_hand(card)
    @hands[:west] << card
  end

  def southern_hand
    @hands[:south]
  end

  def western_hand
    @hands[:west]
  end
end
