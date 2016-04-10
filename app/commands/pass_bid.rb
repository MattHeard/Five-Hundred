class PassBid
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }
  end

  def new_event
    BidPassed.new(player_seat: game_state.current_player_seat)
  end

  def game_state
    CreateGameState.new(game).call
  end

  private

  attr_reader :game
end
