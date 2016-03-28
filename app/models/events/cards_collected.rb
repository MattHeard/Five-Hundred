class CardsCollected < Event
  def apply(game_state)
    game_state.deck = EntireDeck.new.call
    game_state.players.each { |player| player.hand = [] }

    game_state
  end
end
