require 'rails_helper'

RSpec.describe PlayCard do
  subject(:service) { PlayCard.new(game, player, card) }

  let(:game) { Game.create! }
  let(:player) { :south }
  let(:card) { GameState.for(game).hands[player].first }

  describe "#call" do
    before do
      DealAllCards.new(game).call
      service.call
    end

    it "adds a CardPlayed event to the game" do
      expect(game.events.last).to be_instance_of CardPlayed
    end
  end
end