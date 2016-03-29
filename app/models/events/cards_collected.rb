class CardsCollected < Event
  def apply(game_state)
    @game_state = game_state

    game_state.deck = entire_deck
    players.each { |player| player.hand = [] }

    game_state
  end

  private

  attr_reader :game_state

  def entire_deck
    EntireDeck.new.call
  end

  def players
    game_state.players
  end
end
