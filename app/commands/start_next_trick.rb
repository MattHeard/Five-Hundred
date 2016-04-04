class StartNextTrick
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  private

  attr_reader :game

  def create_event
    NextTrickStarted.create!(game: game)
  end
end
