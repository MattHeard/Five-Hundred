class Game < ActiveRecord::Base
  has_many :events

  def add_event(event)
    self.events << event
  end
end
