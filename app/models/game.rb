class Game < ActiveRecord::Base
  def deal
  end

  def north_hand
    ["A♠"] * 10
  end

  def west_hand
    ["A♠"] * 10
  end

  def east_hand
    ["A♠"] * 10
  end

  def south_hand
    ["A♠"] * 10
  end
end
