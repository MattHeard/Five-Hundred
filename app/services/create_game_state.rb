class CreateGameState
  def initialize(game)
    @game = game
  end

  def call
    game.events.inject(GameState.new) { |state, event| event.apply(state) }
  end

  private

  attr_reader :game
end
