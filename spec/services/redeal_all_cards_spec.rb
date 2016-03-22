require 'rails_helper'

RSpec.describe RedealAllCards do
  subject(:service) { RedealAllCards.new(game) }

  let(:game) { Game.create! }

  describe "#initialize" do
    it "should be present" do
      expect(service).to be_present
    end
  end

  describe "#call" do
    before { service.call }

    it "adds a CardsCollected event to the game" do
      expect(game.events.first).to be_instance_of CardsCollected
    end
  end
end
