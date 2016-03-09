class Game < ActiveRecord::Base
  has_many :events

  PLAYERS = %i{north south east west}
end
