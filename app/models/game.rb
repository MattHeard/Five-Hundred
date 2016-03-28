class Game < ActiveRecord::Base
  # TODO dependencies
  has_many :events
end
