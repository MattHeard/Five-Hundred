require 'rails_helper'

RSpec.describe MakeBid do
  let(:number_of_tricks) { 6 }
  let(:trump_suit) { "♠" }
  let(:game) do
    game = Game.create!
    MakeBid.new(game, number_of_tricks, trump_suit).call
    game.reload
    game
  end

  describe "#call" do
    it "adds a BidMade event to the game" do
      expect(game.events.first).to be_instance_of BidMade
    end
  end
end
