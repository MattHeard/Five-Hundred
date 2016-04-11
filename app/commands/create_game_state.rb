class CreateGameState
  def initialize(game)
    @game = game
  end

  def call
    game.events.inject(new_state) { |state, event| event.apply(state) }
  end

  private

  attr_reader :game

  def new_state
    GameState.new
  end
end
