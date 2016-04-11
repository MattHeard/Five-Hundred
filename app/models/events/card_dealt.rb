class CardDealt < Event
  def apply(game_state)
    @game_state = game_state

    game_state.deck.delete(card)
    destination << card

    game_state
  end

  private

  attr_reader :game_state

  def destination
    seat == :kitty ? game_state.kitty : hand 
  end

  def hand
    game_state.player(seat).hand
  end

  def seat
    player_seat.to_sym
  end
end
