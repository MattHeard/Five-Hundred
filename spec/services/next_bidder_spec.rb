require 'rails_helper'

RSpec.describe NextBidder do
  describe "#call" do
    subject(:service) { NextBidder.new(game_state) }

    let(:game_state) { GameState.new }

    before { game_state.bidder = current_bidder }

    context "when the current bidder is North" do
      let(:current_bidder) { :north }

      it "returns East" do
        expect(service.call).to eq :east
      end
    end

    context "when the current bidder is East" do
      let(:current_bidder) { :east }

      it "returns South" do
        expect(service.call).to eq :south
      end
    end

    context "when the current bidder is South" do
      let(:current_bidder) { :south }

      it "returns West" do
        expect(service.call).to eq :west
      end
    end

    context "when the current bidder is West" do
      let(:current_bidder) { :west }

      it "returns North" do
        expect(service.call).to eq :north
      end
    end
  end
end
