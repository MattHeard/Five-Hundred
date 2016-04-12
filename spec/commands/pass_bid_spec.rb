require 'rails_helper'

# LINE | MESSAGE        | ORIGIN   | TYPE    | TEST
# =====|================|==========|=========|===============
# 6    | call           | incoming | query   | assert result
# 7    | game.with_lock | outgoing | command | expect to send
# 7    | events.<<      | outgoing | command | expect to send

RSpec.describe PassBid do
  describe "#call" do
    subject(:service) { PassBid.new(game) }

    let(:game) { Game.create! }

    it "adds a BidPassed event to the game" do
      service.call
      game.reload
      expect(game.events.last).to be_instance_of BidPassed
    end
  end
end
