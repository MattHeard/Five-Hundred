require 'rails_helper'

RSpec.describe CardsCollected do
  describe "#apply" do
    subject(:event) { CardsCollected.create!(game: game) }

    let(:game) { Game.create! }
    let(:game_state) { CreateGameState.new(game).call }
    let(:deck) { Deck.new(game_state).call }

    context "with no previous events" do
      before { event.apply(game_state) }

      it "leaves 43 cards in the deck" do
        expect(deck).to have_exactly(43).items
      end

      it "leaves 0 cards in the south hand" do
        expect(game_state.player(:south).hand).to be_empty
      end
    end

    context "with cards previously dealt" do
      it "leaves 43 cards in the deck" do
        DealAllCards.new(game).call
        event.apply(game_state)
        expect(deck).to have_exactly(43).items
      end
    end
  end
end
