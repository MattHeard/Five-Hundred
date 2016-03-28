require 'rails_helper'

RSpec.describe PlayCard do
  describe "#call" do
    subject(:service) { PlayCard.new(game, player, card) }

    let(:game) { Game.create! }
    let(:player) { :south }
    let(:card) { CreateGameState.new(game).call.hand(player).first }

    it "adds a CardPlayed event to the game" do
      DealAllCards.new(game).call
      service.call
      expect(game.events.last).to be_instance_of CardPlayed
    end
  end
end
