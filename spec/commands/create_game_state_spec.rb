require 'rails_helper'

# Messages:
# 2a.   initialize    - incoming command  - do     unit test
#   NOTE: initialize will not be guarded, so a unit test will not be meaningful
# 6a.   call          - incoming query    - do     unit test
# 7a.   game          - internal          - do not unit test
# 7b.   game.events   - outgoing query    - do not unit test
# 7c.   events.inject - outgoing query    - do not unit test
# 7d.   event.apply   - outgoing query    - do not unit test
# 12a.  game          - internal          - do not unit test
# 14a.  new_state     - internal          - do not unit test
# 15a.  GameState     - outgoing query    - do not unit test
# 15b.  GameState.new - outgoing query    - do not unit test
RSpec.describe CreateGameState do
  describe "#call" do
    it "returns a GameState" do
      game = Game.create!
      service = CreateGameState.new(game)
      expect(service.call).to be_an_instance_of GameState
    end
  end
end
