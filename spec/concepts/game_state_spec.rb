require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { GameState.new }

  context "with no modifications" do
    describe "#deck" do
      it "should have 43 cards" do
        expect(game_state.deck).to have_exactly(43).items
      end

      it "should be a complete deck" do
        expect(game_state.deck).to match_array(GameState::COMPLETE_DECK)
      end
    end

    describe "#kitty" do
      it "should be empty" do
        expect(game_state.kitty).to be_empty
      end
    end

    describe "#dealer" do
      it "should be nil" do
        expect(game_state.dealer).to be nil
      end
    end

    describe "#hands" do
      it "are all empty" do
        expect(game_state.hands.values.flatten).to be_empty
      end
    end

    describe "#in_bidding_phase?" do
      it "is false" do
        expect(game_state).not_to be_in_bidding_phase
      end
    end
  end

  context "with two different bids" do
    let(:game) do
      game = Game.create!
      ChangeDealer.new(game).call
      MakeBid.new(game, 6, "♠").call
      MakeBid.new(game, 7, "♠").call

      game
    end

    subject(:game_state) { GameState.for(game) }

    describe "#highest_bid" do
      it "is the second bid" do
        expect(game_state.highest_bid[:number_of_tricks]).to eq 7
        expect(game_state.highest_bid[:trump_suit]).to eq "♠"
      end
    end
  end
end
