class CreateGameState
  def initialize(game)
    @game = game
  end

  # TODO Isolate dependency on GameState by extracting GameState.new into
  # new_state method
  def call
    game.events.inject(GameState.new) { |state, event| event.apply(state) }
  end

  private

  attr_reader :game
end
