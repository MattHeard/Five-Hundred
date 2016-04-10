class StartNextRound
  def initialize(game)
    @game = game
  end

  # TODO rename `service` to `command`
  def call
    [ CollectAllCards, DealAllCards, ResetBids, ChangeDealer, StartNextTrick ]
      .each { |service| service.new(game).call }
  end

  private

  attr_reader :game
end
