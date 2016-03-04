require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#deck" do
    subject(:game) { Game.new }

    specify "a new game has an unshuffled deck" do
      expect(game.deck.join).to eq Game::UNSHUFFLED_DECK.join
    end
  end
end
