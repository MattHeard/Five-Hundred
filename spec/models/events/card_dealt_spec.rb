require 'rails_helper'

RSpec.describe CardDealt do
  subject(:event) { CardDealt.create!(card: card, target_player: player, game: game) }

  let(:card) { "JOKER" }
  let(:game) { Game.create! }
  let(:game_state) { GameState.new }

  before { event.apply(game_state) }

  describe "#apply" do
    context "dealing a card to the southern player" do
      let(:player) { :south }

      it "reduces the deck by one card" do
        expect(game_state.deck).to have_exactly(42).items
      end

      it "removes the Joker from the deck" do
        expect(game_state.deck).not_to include "JOKER"
      end

      it "puts one card into the southern player's hand" do
        expect(game_state.hands[player]).to have_exactly(1).item
      end
      
      it "puts the Joker into the southern player's hand" do
        expect(game_state.hands[player]).to contain_exactly "JOKER"
      end
    end

    context "dealing a card to the kitty" do
      let(:player) { :kitty }

      it "reduces the deck by one card" do
        expect(game_state.deck).to have_exactly(42).items
      end

      it "removes the Joker from the deck" do
        expect(game_state.deck).not_to include "JOKER"
      end

      it "puts one card into the kitty" do
        expect(game_state.kitty).to have_exactly(1).item
      end
      
      it "puts the Joker into the kitty" do
        expect(game_state.kitty).to contain_exactly "JOKER"
      end
    end
  end
end