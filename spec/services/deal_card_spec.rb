require 'rails_helper'

RSpec.describe DealCard do
  describe "#call" do
    subject(:service) { DealCard.new(game, player) }

    let(:game) { Game.create! }
    let(:player) { :south }

    context "with a full deck" do
      it "adds a CardDealt event to the game" do
        service.call
        game.reload
        expect(game.events.last).to be_instance_of CardDealt
      end
    end

    context "with an empty deck" do
      it "fails" do
        DealAllCards.new(game).call
        expect(service.call).to be false
      end
    end
  end
end
