class ResetBids
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }
  end

  def new_event
    BidsReset.new
  end

  private

  attr_reader :game
end
