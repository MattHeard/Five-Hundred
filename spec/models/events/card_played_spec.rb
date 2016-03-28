require 'rails_helper'

RSpec.describe CardPlayed do
  describe "#apply" do
    subject(:event) do
      CardPlayed.create!(target_player: player, game: game, card: card)
    end

    let(:player) { :south }
    let(:game) { Game.create! }
    let(:game_state) { CreateGameState.new(game).call }
    let(:card) { game_state.hands[player].first }

    it "removes a card from the player's hand" do
      DealAllCards.new(game).call
      game_state = CreateGameState.new(game).call
      event.apply(game_state)
      expect(game_state.hands[player]).to have_exactly(9).items
    end
  end
end
