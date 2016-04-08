require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { CreateGameState.new(game).call }

  let(:game) { Game.create! }

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

    describe "#in_bidding_phase?" do
      it "is false" do
        expect(game_state.phase).not_to eq :bidding
      end
    end

    describe "#trick" do
      it "is empty or has nil values" do
        expect(game_state.trick.cards_count).to eq 0
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
        expect(game_state.phase).to eq :bidding
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

        expect(game_state.phase).to eq :play
      end
    end
  end

  context "when two players have played a card" do
    before do
      DealAllCards.new(game).call
      ChangeDealer.new(game).call
      MakeBid.new(game, 6, "♠").call
      3.times { PassBid.new(game).call }
      %i{ north east }.each do |seat|
        hand = game_state.player(seat).hand
        card = hand.first
        PlayCard.new(game, seat, card).call
      end
      game.reload
    end

    describe "#complete_trick?" do
      it "is false" do
        game_state = CreateGameState.new(game).call
        expect(game_state).not_to be_complete_trick
      end
    end

    describe "#in_play_phase?" do
      it "is true" do
        game_state = CreateGameState.new(game).call
        expect(game_state.phase).to eq :play
      end
    end
  end

  context "when all players have played a card" do
    before do
      DealAllCards.new(game).call
      ChangeDealer.new(game).call
      MakeBid.new(game, 6, "♠").call
      3.times { PassBid.new(game).call }
      %i{ north south east west}.each do |seat|
        hand = game_state.player(seat).hand
        card = hand.first
        PlayCard.new(game, seat, card).call
      end
      game.reload
    end

    describe "#complete_trick?" do
      it "is true" do
        game_state = CreateGameState.new(game).call
        expect(game_state).to be_complete_trick
      end
    end

    describe "#in_play_phase?" do
      it "is false" do
        game_state = CreateGameState.new(game).call
        expect(game_state.phase).not_to eq :play
      end
    end

    describe "#trick_winning_player" do
      it "is present" do
        game_state = CreateGameState.new(game).call
        expect(game_state.trick_winning_player).to be_present
      end
    end

    describe "#scoreboard" do
      it "is present" do
        game_state = CreateGameState.new(game).call
        expect(game_state.scoreboard).to be_present
      end
    end
  end
end
