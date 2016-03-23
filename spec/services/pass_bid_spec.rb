require 'rails_helper'

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
