class Player
  attr_reader :seat
  attr_accessor :hand

  def initialize(seat)
    @seat = seat
    @hand = []
  end
end
