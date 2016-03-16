class Player
  attr_reader :seat, :hand

  def initialize(seat)
    @seat = seat
    @hand = []
  end
end
