require 'rails_helper'

RSpec.describe ChangeDealer do
  describe "#call" do
    subject(:service) { ChangeDealer.new(game) }

    let(:game) { Game.create! }

    context "with no previous dealer" do
      it "adds a DealerChanged event to the game" do
        service.call
        game.reload
        expect(game.events.last).to be_instance_of DealerChanged
      end
    end

    context "with a previous dealer" do
      it "adds a DealerChanged event to the game" do
        2.times { service.call }
        game.reload
        expect(game.events.last).to be_instance_of DealerChanged
      end
    end
  end
end
