require 'rails_helper'

def entire_deck
  EntireDeck.new.call
end

RSpec.describe DealAllCards do
  DECK_SIZE = 43

  describe "#call" do
    subject(:service) { DealAllCards.new(game) }

    let(:game_state) do
      game_state = instance_double("GameState")
      allow(game_state).to receive(:deck) { deck }

      game_state
    end

    let(:events) do
      events = double
      allow(events).to receive(:inject) { game_state }

      events
    end

    let(:game) do
      game = instance_double("Game")
      allow(game).to receive(:events) { events }
      allow(game).to receive(:with_lock)

      game
    end

    let(:deal_card_service) { instance_double("DealCard") }

    context "when the deck is full" do
      let(:deck) { entire_deck }

      # incoming query - assert result
      it "is truthy" do
        expect(service.call).to be_truthy
      end

      # outgoing command - expect to send
      it "calls DealCard#call once per card in the deck" do
        allow(DealCard).to receive(:new) { deal_card_service }
        expect(deal_card_service).to receive(:call).exactly(DECK_SIZE).times
        service.call
      end
    end

    context "when the deck is not full" do
      let(:deck) { [] }

      # incoming query - assert result
      it "is falsey" do
        expect(service.call).to be_falsey
      end
    end
  end
end
