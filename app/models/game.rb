class Game < ActiveRecord::Base
  # TODO dependencies destroy
  has_many :events
end
