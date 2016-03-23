require 'rails_helper'

RSpec.describe NextBidder do
  describe "#call" do
    subject(:service) { NextBidder.new(game_state) }

    let(:game_state) { GameState.new }

    it "returns East when the previous bidder was North" do
      game_state.bidder = :north
      expect(service.call).to eq :east
    end

    it "returns South when the previous bidder was East" do
      game_state.bidder = :east
      expect(service.call).to eq :south
    end

    it "returns West when the previous bidder was South" do
      game_state.bidder = :south
      expect(service.call).to eq :west
    end

    it "returns North when the previous bidder was West" do
      game_state.bidder = :west
      expect(service.call).to eq :north
    end
  end
end
