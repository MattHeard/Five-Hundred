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

  context "of a new game" do
    describe "#call" do
      it "should return an empty list" do
        expect(service.call).to be_empty
      end
    end
  end
end
