require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { GameState.new }

  describe "#deck" do
    it "should have a size" do
      expect(game_state.deck).to respond_to(:size)
    end
  end

  describe "#remove_from_deck" do
    let(:card) { "JOKER" }

    it "should reduce the size of the deck to 42" do
      game_state.remove_from_deck(card)

      expect(game_state.deck).to have_exactly(42).items
    end
  end
end
