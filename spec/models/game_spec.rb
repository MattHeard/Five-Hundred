require 'rails_helper'

RSpec.describe Game, type: :model do
  UNSHUFFLED_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER }

  describe "#deck" do
    subject(:game) { Game.new }

    specify "a new game has an unshuffled deck" do
      expect(game.deck.join).to eq UNSHUFFLED_DECK.join
    end
  end
end
