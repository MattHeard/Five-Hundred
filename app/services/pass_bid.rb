class PassBid
  def initialize(game)
    @game = game
  end

  def call
    bidder = GameState.for(@game).bidder
    @game.with_lock do
      BidPassed.create!(target_player: bidder, game: @game)
    end
  end
end
