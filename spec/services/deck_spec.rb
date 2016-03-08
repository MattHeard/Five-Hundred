require 'rails_helper'

RSpec.describe Deck do
  let(:game) do
    game = instance_double("Game")
    allow(game).to receive(:events) { [ ] }

    game
  end

  subject(:service) { Deck.new(game) }

  describe "#initialize" do
    it "should take a game and be present" do
      expect(service).to be_present
    end
  end

  describe "#call" do
    it "should return something with a size" do
      expect(service.call).to respond_to(:size)
    end
  end

  context "with no cards dealt" do
    it "should have 43 cards" do
      expect(service.call).to have_exactly(43).items
    end
  end
end
