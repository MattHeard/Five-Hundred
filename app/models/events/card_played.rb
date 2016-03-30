class CardPlayed < Event
  def apply(game_state)
    @game_state = game_state

    game_state.hand(player).delete(card)
    game_state.trick[player] = card
    game_state.current_player_seat = next_player_seat

    game_state
  end

  private

  attr_reader :game_state

  def next_player_seat
    NextPlayer.new(game_state.current_player_seat).call
  end

  def player
    player_seat.to_sym
  end
end
