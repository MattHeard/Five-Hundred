class DeckShuffled < Event
  def self.build
    DeckShuffled.new(state_attribute: :deck=, encoded_value: encode(shuffled_deck))
  end

  def value
    (encoded_value || "").split
  end

  def apply
    game.deck = value
  end

  private

  def self.shuffled_deck
    Game::UNSHUFFLED_DECK.shuffle
  end

  def self.encode(deck)
    deck.map { |card| (card << (" " * 6))[0, 6] }.join
  end
end
