class SouthernHand
  def initialize(game)
    @game = game
  end

  def call
    game_state = @game.events.inject(GameState.new) do |state, event|
      event.apply(state)
      state
    end

    game_state.southern_hand
  end
end
