require 'rails_helper'

RSpec.describe DeckShuffled, type: :model do
  context "as a new event" do
    subject(:event) { DeckShuffled.new }

    it "should have no associated game" do
      expect(event.game).to be nil
    end

    it "should have no state_attribute" do
      expect(event.state_attribute).to be nil
    end

    it "should have no encoded value" do
      expect(event.encoded_value).to be nil
    end

    it "should have an empty array for a value" do
      expect(event.value).to be_empty
    end
  end

  context "built from the factory" do
    subject(:event) { DeckShuffled.build }

    it "should have no associated game" do
      expect(event.game).to be nil
    end

    it "should modify the deck" do
      expect(event.state_attribute).to eq "deck="
    end

    it "should have an encoded value" do
      expect(event.encoded_value).to be_present
    end

    it "should have an array which is not empty for its value" do
      expect(event.value).not_to be_empty
    end

    it "should have not have an unshuffled deck for its value" do
      expect(event.value.join).not_to eq Game::UNSHUFFLED_DECK.join
    end
  end

  context "applied to a newly created game" do
    subject(:event) { DeckShuffled.build }

    it "does not shuffle the deck when added but not applied" do
      game = Game.create
      game.events << event
      expect(game.deck.join).to eq Game::UNSHUFFLED_DECK.join
    end

    it "shuffles the deck when applied to a game" do
      game = Game.create
      game.events << event
      game.apply_events
      expect(game.deck.join).not_to eq Game::UNSHUFFLED_DECK.join
    end

    it "keeps same shuffled order when re-applied after database retrieval" do
      original_game = Game.create
      original_game.events << event
      original_game.apply_events
      shuffled_deck = original_game.deck

      id = original_game.id
      retrieved_game = Game.find(id)
      retrieved_game.apply_events
      expect(retrieved_game.deck.join).to eq shuffled_deck.join
    end
  end
end
