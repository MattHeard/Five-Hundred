require 'rails_helper'

RSpec.describe Game, type: :model do
  HAND_SIZE = 10
  KITTY_SIZE = 3

  describe "#deal" do
    subject(:game) { Game.new }

    before { game.deal }
    
    specify "each hand has 10 cards" do
      expect(game.hands[:north]).to have_exactly(HAND_SIZE).items
      expect(game.hands[:west]).to have_exactly(HAND_SIZE).items
      expect(game.hands[:east]).to have_exactly(HAND_SIZE).items
      expect(game.hands[:south]).to have_exactly(HAND_SIZE).items
    end

    specify "the kitty has 3 cards" do
      expect(game.kitty).to have_exactly(KITTY_SIZE).items
    end

    specify "the dealt cards are unique" do
      dealt_cards = game.kitty + %i{north west east south}.inject([]) do |hands, seat|
        hands + game.hands[seat]
      end

      expect(dealt_cards.uniq).to eq dealt_cards
    end
  end
end
