class StartNextRound
  def initialize(game)
    @game = game
  end

  def call
    DiscardAllCards.new(game).call
    DealAllCards.new(game).call
  end

  private

  attr_reader :game
end
