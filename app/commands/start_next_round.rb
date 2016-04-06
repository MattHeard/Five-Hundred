require 'pp'

class StartNextRound
  def initialize(game)
    @game = game
  end

  def call
    CollectAllCards.new(game).call
    DealAllCards.new(game).call
    ResetBids.new(game).call
    StartNextTrick.new(game).call
  end

  private

  attr_reader :game
end
