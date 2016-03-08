class GameState
  COMPLETE_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  attr_reader :deck
  attr_reader :southern_hand

  def initialize
    @deck = COMPLETE_DECK
    @southern_hand = [ ]
  end

  def remove_from_deck(card)
    @deck.delete(card)
  end

  def add_to_the_southern_hand(card)
    @southern_hand << card
  end
end
