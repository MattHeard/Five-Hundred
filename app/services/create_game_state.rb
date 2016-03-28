class CreateGameState
  def initialize(game)
    @game = game
  end

  def call
    game.events.inject(GameState.new) do |state, event|
      event.apply(state)

      state
    end
  end

  private

  attr_reader :game
end
