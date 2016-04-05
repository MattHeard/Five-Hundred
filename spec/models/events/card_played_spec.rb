require 'pp'
require 'rails_helper'

RSpec.describe CardPlayed do
  describe "#apply" do
    let(:card) { game_state.hand(player).first }
    subject(:event) { CardPlayed.create!(player_seat: player, game: game, card: card) }

    let(:game_state) { CreateGameState.new(game).call }
    let(:game) { Game.create! }
    let(:player) { :south }

    it "removes a card from the player's hand" do
      DealAllCards.new(game).call
      ChangeDealer.new(game).call
      game.reload
      event.apply(game_state)
      expect(game_state.hand(player)).to have_exactly(9).items
    end
  end
end
