class NextBidder
  def initialize(game_state)
    @game_state = game_state
  end

  def call
    old_bidder = @game_state.bidder
    NextPlayer.new(old_bidder).call
  end
end
