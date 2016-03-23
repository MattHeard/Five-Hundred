require 'rails_helper'

RSpec.describe DealCard do
  describe "#call" do
    subject(:service) { DealCard.new(game, player) }

    let(:game) { Game.create! }
    let(:player) { :south }

    it "adds a CardDealt event to the game" do
      service.call
      game.reload
      expect(game.events.last).to be_instance_of CardDealt
    end
  end
end
