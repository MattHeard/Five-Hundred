class NextPlayer
  attr_reader :current_player

  def initialize(current_player)
    @current_player = current_player
  end

  # TODO investigate `succ`
  # PLAYERS[current].succ || PLAYERS[0]
  def call
    index = Game::PLAYERS.index(current_player)
    size = Game::PLAYERS.size
    Game::PLAYERS[(index + 1) % size]
  end
end