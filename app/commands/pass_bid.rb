class PassBid
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  def create_event
    BidPassed.create!(player_seat: game_state.current_player_seat, game: game)
  end

  def game_state
    CreateGameState.new(game).call
  end

  private

  attr_reader :game
end
