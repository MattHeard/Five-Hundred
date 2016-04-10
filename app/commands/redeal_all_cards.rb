class RedealAllCards
  def initialize(game)
    @game = game
  end

  def call
    CollectCards.new(game).call
    DealAllCards.new(game).call
  end

  private

  attr_reader :game
end
