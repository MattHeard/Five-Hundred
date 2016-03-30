require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { GameState.new }

  context "with no modifications" do
    describe "#deck" do
      it "should have 43 cards" do
        expect(game_state.deck).to have_exactly(43).items
      end

      it "should be a complete deck" do
        expect(game_state.deck).to match_array(EntireDeck.new.call)
      end
    end

    describe "#kitty" do
      it "should be empty" do
        expect(game_state.kitty).to be_empty
      end
    end

    describe "#dealer_seat" do
      it "should be nil" do
        expect(game_state.dealer_seat).to be nil
      end
    end

    describe "#current_player_seat" do
      it "should be nil" do
        expect(game_state.current_player_seat).to be nil
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

    describe "#trick" do
      it "is empty or has nil values" do
        expect(game_state.trick).to be_none
      end
    end

    describe "#card_played?" do
      it "is false" do
        expect(game_state.card_played?(:south)).to be false
      end
    end

    describe "#complete_trick?" do
      it "is false" do
        expect(game_state).not_to be_complete_trick
      end
    end
  end

  context "when the dealer has been set" do
    let(:game) { Game.create! }

    before do
      [ DealAllCards, ChangeDealer ].each { |service| service.new(game).call }

      game.reload
    end

    subject(:game_state) { CreateGameState.new(game).call }

    describe "#current_player_seat" do
      it "is present" do
        expect(game_state.current_player_seat).to be_present
      end
    end
  end

  context "with two different bids" do
    let(:game) do
      game = Game.create!
      DealAllCards.new(game).call
      ChangeDealer.new(game).call
      MakeBid.new(game, 6, "♠").call
      MakeBid.new(game, 7, "♠").call
      game.reload

      game
    end

    subject(:game_state) { CreateGameState.new(game).call }

    describe "#highest_bid" do
      it "is the second bid" do
        expect(game_state.highest_bid.number_of_tricks).to eq 7
        expect(game_state.highest_bid.trump_suit).to eq "♠"
      end
    end

    describe "#in_bidding_phase?" do
      it "is true" do
        expect(game_state).to be_in_bidding_phase
      end
    end
  end

  context "when all players have bid or passed" do
    describe "#in_play_phase?" do
      subject(:game_state) { CreateGameState.new(game).call }

      let(:game) { Game.create! }

      it "is true" do
        DealAllCards.new(game).call
        ChangeDealer.new(game).call
        MakeBid.new(game, 6, "♠").call
        3.times { PassBid.new(game).call }
        game.reload

        expect(game_state).to be_in_play_phase
      end
    end
  end

  context "when all players have played a card" do
    describe "#complete_trick?" do
      let(:game) { Game.create! }

      it "is true" do
        DealAllCards.new(game).call
        game_state = CreateGameState.new(game).call
        %i{ north south east west}.each do |player|
          hand = game_state.hand(player)
          card = hand.first
          PlayCard.new(game, player, card).call
        end
        game_state = CreateGameState.new(game).call

        expect(game_state).to be_complete_trick
      end
    end
  end
end
