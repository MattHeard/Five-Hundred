require 'rails_helper'

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
  end
end
