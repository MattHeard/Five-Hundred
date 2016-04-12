require 'rails_helper'

# LINE | MESSAGE              | ORIGIN   | TYPE    | TEST
# =====|======================|==========|=========|===============
# 7    | call                 | incoming | query   | assert result
# 8    | CollectAllCards.call | outgoing | command | expect to send
# 9    | DealAllCards.call    | outgoing | command | expect to send

RSpec.describe RedealAllCards do
  describe "#call" do
    subject(:service) { RedealAllCards.new(game) }

    let(:game) { Game.create! }

    it "adds a AllCardsCollected event to the game" do
      service.call
      expect(game.events.first).to be_instance_of AllCardsCollected
    end
  end
end
