require 'rails_helper'

RSpec.describe DealCardToTheWesternPlayer do
  let(:game) do
    game = instance_double("Game")
    allow(game).to receive(:add_event)
    allow(game).to receive(:events) { [ ] }

    game
  end

  subject(:service) { DealCardToTheWesternPlayer.new(game) }

  xdescribe "#initialize" do
    it "should take a game and be present" do
      expect(service).to be_present
    end
  end

  xdescribe "#call" do
    it "should return nil" do
      expect(service.call).to be nil
    end
  end
end
