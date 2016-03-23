require 'rails_helper'

RSpec.describe RedealAllCards do
  describe "#call" do
    subject(:service) { RedealAllCards.new(game) }

    let(:game) { Game.create! }

    it "adds a CardsCollected event to the game" do
      service.call
      expect(game.events.first).to be_instance_of CardsCollected
    end
  end
end
