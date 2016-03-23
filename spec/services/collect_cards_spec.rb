require 'rails_helper'

RSpec.describe CollectCards do
  describe "#call" do
    subject(:service) { CollectCards.new(game) }

    let(:game) { Game.create! }

    it "adds a CardsCollected event to the game" do
      service.call
      expect(game.events.last).to be_instance_of CardsCollected
    end
  end
end
