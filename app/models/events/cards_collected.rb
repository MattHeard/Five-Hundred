class CardsCollected < Event
  def apply(game_state)
    @game_state = game_state

    game_state.deck = entire_deck
    discard_hands 

    game_state
  end

  private

  attr_reader :game_state

  def entire_deck
    EntireDeck.new.call
  end

  def discard_hands
    game_state.players.each { |player| discard_hand(player) }
  end

  def discard_hand(player)
    player.hand = []
  end
end
