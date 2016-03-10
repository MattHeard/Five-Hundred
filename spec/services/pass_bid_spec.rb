require 'rails_helper'

RSpec.describe PassBid do
  let(:game) do
    game = Game.create!
    PassBid.new(game).call
    game.reload
    game
  end

  describe "#call" do
    it "adds a BidPassed event to the game" do
      expect(game.events.first).to be_instance_of BidPassed
    end
  end
end
