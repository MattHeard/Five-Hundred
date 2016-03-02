require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#deal" do
    subject(:game) { Game.new }
    
    specify do
      HAND_SIZE = 10

      game.deal

      expect(game.south_hand).to have_exactly(HAND_SIZE).items
    end
  end
end
