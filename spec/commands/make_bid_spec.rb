require 'rails_helper'

# LINE | MESSAGE        | ORIGIN   | TYPE    | TEST
# =====|================|==========|=========|===============
# 7    | call           | incoming | query   | assert result
# 8    | game.with_lock | outgoing | command | expect to send
# 12   | events.<<      | outgoing | command | expect to send

RSpec.describe MakeBid do
  let(:number_of_tricks) { 6 }
  let(:trump_suit) { "♠" }
  let(:game) { Game.create! }
  subject(:service) { MakeBid.new(game, number_of_tricks, trump_suit) }

  before { PickRandomDealer.new(game).call }

  describe "#call" do
    context "with no previous bids" do
      it "adds a BidMade event to the game" do
        service.call
        game.reload
        expect(game.events.second).to be_instance_of BidMade
      end
    end

    context "with a previous identical bid" do
      it "fails" do
        service.call
        game.reload
        expect(service.call).to be false
      end
    end

    context "after the bidder has previously passed" do
      it "fails" do
        4.times { PassBid.new(game).call }
        game.reload
        expect(service.call).to be false
      end
    end
  end
end
