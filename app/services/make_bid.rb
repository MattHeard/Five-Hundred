class MakeBid
  def initialize(game, number_of_tricks, trump_suit)
    @game, @number_of_tricks, @trump_suit = game, number_of_tricks, trump_suit
  end

  def call
    bidder = GameState.for(@game).bidder
    @game.with_lock do
      BidMade.create!(target_player: bidder,
                      number_of_tricks: @number_of_tricks,
                      trump_suit: @trump_suit,
                      game: @game)
    end
  end
end
