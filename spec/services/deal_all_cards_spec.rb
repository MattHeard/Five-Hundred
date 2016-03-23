require 'pp'
require 'rails_helper'

RSpec.describe DealAllCards do
  DECK_SIZE = 43

  describe "#call" do
    subject(:service) { DealAllCards.new(game) }

    let(:game) { Game.create! }

    before do
      service.call
      game.reload
    end

    it "adds a CardDealt event to the game" do
      expect(game.events.first).to be_instance_of CardDealt
    end

    it "adds one event to the game for each card in the deck" do
      expect(game.events).to have_exactly(DECK_SIZE).items
    end
  end
end
