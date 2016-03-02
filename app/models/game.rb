class Game < ActiveRecord::Base
  HEARTS_CHARACTER = "♥"
  DIAMONDS_CHARACTER = "♦"
  SPADES_CHARACTER = "♠"
  CLUBS_CHARACTER = "♣"

  attr_reader :hands

  def deal
    deck = unshuffled_deck.shuffle
    @hands = { :north => [ ], :west => [ ], :east => [ ], :south => [ ] }
    @kitty = [ ]

    # Cards are dealt in a particular order
    # See: https://www.pagat.com/euchre/500.html#deal
    @hands.each { |seat, hand| @hands[seat] = hand + deck.shift(3) }
    @kitty << deck.shift
    @hands.each { |seat, hand| @hands[seat] = hand + deck.shift(4) }
    @kitty << deck.shift
    @hands.each { |seat, hand| @hands[seat] = hand + deck.shift(3) }
    @kitty << deck.shift
  end

  def kitty
    @kitty
  end

  private

  def unshuffled_deck
    (unshuffled_black_cards + unshuffled_red_cards) << joker_card
  end

  def unshuffled_red_cards
    unshuffled_hearts + unshuffled_diamonds
  end

  def unshuffled_hearts
    red_suit_ranks.map { |rank| rank + HEARTS_CHARACTER }
  end

  def red_suit_ranks
    black_suit_ranks + ["4"]
  end

  def black_suit_ranks
    %w{A K Q J 10 9 8 7 6 5}
  end

  def unshuffled_diamonds
    red_suit_ranks.map { |rank| rank + DIAMONDS_CHARACTER }
  end

  def unshuffled_spades
    black_suit_ranks.map { |rank| rank + SPADES_CHARACTER }
  end

  def unshuffled_clubs
    black_suit_ranks.map { |rank| rank + CLUBS_CHARACTER }
  end

  def unshuffled_black_cards
    unshuffled_spades + unshuffled_clubs
  end

  def joker_card
    "JOKER"
  end
end
