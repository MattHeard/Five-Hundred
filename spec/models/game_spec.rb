require 'rails_helper'

RSpec.describe Game, type: :model do
  HAND_SIZE = 10

  describe "#deal" do
    subject(:game) { Game.new }
    
    specify do
      game.deal

      expect(game.north_hand).to have_exactly(HAND_SIZE).items
      expect(game.west_hand).to have_exactly(HAND_SIZE).items
      expect(game.east_hand).to have_exactly(HAND_SIZE).items
      expect(game.south_hand).to have_exactly(HAND_SIZE).items
    end
  end
end
