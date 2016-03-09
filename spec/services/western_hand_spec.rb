require 'rails_helper'

RSpec.describe WesternHand do
  let(:game) do
    game = instance_double("Game")
    allow(game).to receive(:events) { [ ] }

    game
  end

  subject(:service) { WesternHand.new(game) }

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

  context "of a game with one CardDealtToTheWesternHand event" do
    let(:event) { instance_double("CardDealtToTheWesternHand") }
    let(:game) do
      game = instance_double("Game")
      allow(game).to receive(:events) { [ event ] }

      game
    end

    describe "#call" do
      it "should return a list with a single card" do
        expect(service.call).to have_exactly(1).item
      end
    end
  end
end
