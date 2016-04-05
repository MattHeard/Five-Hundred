class DiscardAllCards
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  private

  def create_event
    AllCardsDiscarded.create!(game: game)
  end

  attr_reader :game
end
