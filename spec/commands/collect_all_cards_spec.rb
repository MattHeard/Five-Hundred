require 'rails_helper'

# Messages:
# 2a.   initialize            - incoming command  - do not unit test
#   NOTE: initialize will not be guarded, so a unit test will not be meaningful
# 6a.   call                  - incoming query    - do     unit test
# 6a.   call                  - incoming command  - do     unit test
# 7a.   game                  - internal          - do not unit test
# 7b.   game.with_lock        - outgoing command  - do     unit test
# 7c.   game.events           - outgoing query    - do not unit test
# 7d.   events.<<             - outgoing command  - do     unit test
# 7e.   new_event             - internal          - do not unit test
# 12a.  game                  - internal          - do not unit test
# 14a.  new_event             - internal          - do not unit test
# 15a.  AllCardsCollected     - outgoing query    - do not unit test
# 15b.  AllCardsCollected.new - outgoing query    - do not unit test
RSpec.describe CollectAllCards do
  describe "#call" do
    subject(:service) { CollectAllCards.new(game) }

    let(:game) { Game.new }

    # TODO Mock locking
    it "sends #with_lock to Game"

    it "sends #<< to Game.events"

    it "adds one event to the game" do
      events_count_before = game.events.size
      service.call
      events_count_after = game.events.size
      expect(events_count_after).to eq (events_count_before + 1)
    end

    it "adds an AllCardsCollected event" do
      service.call
      expect(game.events.last).to be_instance_of AllCardsCollected
    end

    it "is truthy" do
      expect(service.call).to be_truthy
    end
  end
end
