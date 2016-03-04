class DeckShuffled < Event
  UNSHUFFLED_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  def self.build
    DeckShuffled.new(state_attribute: :deck=, encoded_value: encode(shuffled_deck))
  end

  def value
    encoded_value.split
  end

  private

  def self.shuffled_deck
    UNSHUFFLED_DECK.shuffle
  end

  def self.encode(deck)
    deck.map { |card| (card << (" " * 6))[0, 6] }.join
  end
end
