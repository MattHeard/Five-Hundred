class CollectCards
  def initialize(game)
    @game = game
  end

  # TODO Add event to game.events
  def call
    game.with_lock do
      CardsCollected.create!(game: game)
    end
  end

  private

  attr_reader :game
end
