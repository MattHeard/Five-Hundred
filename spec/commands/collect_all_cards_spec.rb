require 'rails_helper'

# LINE | MESSAGE        | ORIGIN   | TYPE    | TEST
# =====|================|==========|=========|===============
# 6    | call           | incoming | query   | assert result
# 7    | game.with_lock | outgoing | command | expect to send
# 8    | events.<<      | outgoing | command | expect to send

RSpec.describe CollectAllCards do
  EVENTS_CLASS_NAME = "Event::ActiveRecord_Associations_CollectionProxy"

  describe "#call" do
    subject(:service) { CollectAllCards.new(game) }

    let(:events) do
      events = instance_double(EVENTS_CLASS_NAME)
      allow(events).to receive(:<<)

      events
    end

    let(:game) do
      game = instance_double("Game")
      allow(game).to receive(:with_lock).and_yield
      allow(game).to receive(:events) { events }

      game
    end

    # outgoing command - expect to send
    it "sends #with_lock to Game" do
      expect(game).to receive(:with_lock)
      service.call
    end

    # outgoing command - expect to send
    it "sends #<< to Event::ActiveRecord_Associations_CollectionProxy" do
      expect(events).to receive(:<<)
      service.call
    end

    # incoming query - assert result
    it "is truthy" do
      expect(service.call).to be_truthy
    end
  end
end
