class Deck
  def initialize(game)
    @game = game
  end

  def call
    game_state = @game.events.inject(GameState.new) do |state, event|
      event.apply(state)
    end

    game_state.deck
  end
end
