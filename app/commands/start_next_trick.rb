class StartNextTrick
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }
  end

  private

  attr_reader :game

  def new_event
    NextTrickStarted.new
  end
end
