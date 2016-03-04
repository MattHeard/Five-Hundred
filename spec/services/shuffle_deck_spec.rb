require 'rails_helper'

RSpec.describe ShuffleDeck do
  context "with a new game" do
    subject(:game) { Game.create }

    specify "it should shuffle the deck" do
      expect(game.deck.join).to eq Game::UNSHUFFLED_DECK.join
      expect(game.events).to be_empty
      expect(ShuffleDeck.new(game).call).to be true
      expect(game.deck.join).not_to eq Game::UNSHUFFLED_DECK.join
      expect(game.events).to have_exactly(1).item
    end
  end
end
