require 'rails_helper'

RSpec.describe Game, type: :model do
  HAND_SIZE = 10

  describe "#deal" do
    subject(:game) { Game.new }
    
    specify "each hand has 10 cards" do
      game.deal

      expect(game.hand(:north)).to have_exactly(HAND_SIZE).items
      expect(game.hand(:west)).to have_exactly(HAND_SIZE).items
      expect(game.hand(:east)).to have_exactly(HAND_SIZE).items
      expect(game.hand(:south)).to have_exactly(HAND_SIZE).items
    end
  end
end
