class CollectAllCards
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }

    true
  end

  private

  attr_reader :game

  def new_event
    AllCardsCollected.new
  end
end
