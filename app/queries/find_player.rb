class FindPlayer
  def initialize(game_state, seat)
    @game_state, @seat = game_state, seat
  end

  def call
    players.find { |player| player.seat == seat }
  end

  private

  attr_reader :game_state, :seat

  def players
    game_state.players
  end
end
