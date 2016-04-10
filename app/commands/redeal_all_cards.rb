class RedealAllCards
  def initialize(game)
    @game = game
  end

  # TODO DRY into looping over array of classes
  def call
    CollectAllCards.new(game).call
    DealAllCards.new(game).call
  end

  private

  attr_reader :game
end
