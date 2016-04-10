class NextSeat
  def initialize(current_player)
    @current_player = current_player
  end

  def call
    players[index.succ] || players.first
  end

  private

  attr_reader :current_player

  def index
    players.index(current_player)
  end

  def players
    Seats.new.call
  end
end
