class Game < ActiveRecord::Base
  def deal
  end

  def south_hand
    ["A♠"] * 10
  end
end
