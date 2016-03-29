class Player
  attr_reader :seat
  attr_accessor :hand, :played_card, :bid

  def initialize(seat)
    @seat = seat
    @hand = []
  end
end
