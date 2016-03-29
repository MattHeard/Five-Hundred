class CardDealt < Event
  def apply(game_state)
    @game_state = game_state

    deck.delete(card)
    destination << card

    game_state
  end

  private

  attr_reader :game_state

  def deck
    Deck.new(game_state).call
  end

  def destination
    player == :kitty ? game_state.kitty : game_state.hand(player)
  end

  def player
    player_seat.to_sym
  end
end
