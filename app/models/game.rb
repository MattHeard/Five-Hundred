class Game < ActiveRecord::Base
  has_many :events

  PLAYERS = %i{north east south west}
end
