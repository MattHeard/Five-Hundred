require 'pp'

class CardDealt < Event
  def apply(game_state)
    game_state.deck.delete(card)
    game_state.hands[target_player.to_sym] << card
  end
end
