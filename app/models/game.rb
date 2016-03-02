class Game < ActiveRecord::Base
  def deal
  end

  def hand(seat)
    ["A♠"] * 10
  end

  def kitty
    ["A♠"] * 3
  end
end
