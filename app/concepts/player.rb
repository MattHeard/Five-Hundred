class Player
  attr_reader :seat
  attr_accessor :hand, :played_card, :bid

  def initialize(seat)
    @seat = seat
    @hand = []
  end

  def name
    seat.to_s.titlecase
  end

  def discard_hand
    @hand = []
  end
end
