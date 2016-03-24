class CreateGameState
  def initialize(game)
    @game = game
  end

  def call
    GameState.for(game)
  end

  private

  attr_reader :game
end
