require 'rails_helper'

RSpec.describe NextPlayer do
  describe "#call" do
    subject(:service) { NextPlayer.new(current_player) }

    context "when the current player is North" do
      let(:current_player) { :north }

      it "returns East" do
        expect(service.call).to eq :east
      end
    end

    context "when the current player is East" do
      let(:current_player) { :east }

      it "returns South" do
        expect(service.call).to eq :south
      end
    end

    context "when the current player is South" do
      let(:current_player) { :south }

      it "returns West" do
        expect(service.call).to eq :west
      end
    end

    context "when the current player is West" do
      let(:current_player) { :west }

      it "returns North" do
        expect(service.call).to eq :north
      end
    end
  end
end
