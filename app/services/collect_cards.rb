class CollectCards
  def initialize(game)
    @game = game
  end

  # TODO Add event to game.events
  def call
    game.with_lock { create_event }
  end

  private

  attr_reader :game

  def create_event
    CardsCollected.create!(game: game)
  end
end
