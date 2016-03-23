class NextBidder
  attr_reader :game_state

  def initialize(game_state)
    @game_state = game_state
  end

  def call
    previous_bidder = game_state.bidder
    NextPlayer.new(previous_bidder).call
  end
end
