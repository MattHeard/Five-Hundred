class PassBid
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  def create_event
    BidPassed.create!(target_player: game_state.bidder_seat, game: game)
  end

  def game_state
    CreateGameState.new(game).call
  end
end
