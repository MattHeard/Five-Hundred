require 'rails_helper'

# LINE | MESSAGE        | ORIGIN   | TYPE    | TEST
# =====|================|==========|=========|===============
# 6    | call           | incoming | query   | assert result
# 7    | game.with_lock | outgoing | command | expect to send
# 7    | events.<<      | outgoing | command | expect to send

RSpec.describe PlayCard do
  describe "#call" do
    subject(:service) { PlayCard.new(game, seat, card) }

    let(:game) { Game.create! }
    let(:seat) { :south }
    let(:card) { CreateGameState.new(game).call.player(seat).hand.first }

    it "adds a CardPlayed event to the game" do
      DealAllCards.new(game).call
      service.call
      expect(game.events.last).to be_instance_of CardPlayed
    end
  end
end
