require 'rails_helper'

RSpec.describe MakeBid do
  let(:number_of_tricks) { 6 }
  let(:trump_suit) { "♠" }
  let(:game) do
    Game.create!
  end

  context "with no previous bids" do
    before do
      ChangeDealer.new(game).call
      MakeBid.new(game, number_of_tricks, trump_suit).call
      game.reload
    end

    describe "#call" do
      it "adds a BidMade event to the game" do
        expect(game.events.second).to be_instance_of BidMade
      end
    end
  end

  context "with a previous bid of 6 Spades" do
    before do
      ChangeDealer.new(game).call
      MakeBid.new(game, number_of_tricks, trump_suit).call
      game.reload
    end

    describe "#call" do
      it "returns false when a second bid of 6 Spades is made" do
        service = MakeBid.new(game, number_of_tricks, trump_suit)
        expect(service.call).to be false
      end
    end
  end

  context "after the bidder has previously passed" do
    before do
      ChangeDealer.new(game).call
      4.times { PassBid.new(game).call }
      game.reload
    end

    describe "#call" do
      it "returns false when a second bid of 6 Spades is made" do
        service = MakeBid.new(game, number_of_tricks, trump_suit)
        expect(service.call).to be false
      end
    end
  end
end
