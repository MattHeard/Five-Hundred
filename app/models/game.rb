class Game < ActiveRecord::Base
  # TODO dependencies
  has_many :events

  PLAYERS = %i{north east south west}
end
