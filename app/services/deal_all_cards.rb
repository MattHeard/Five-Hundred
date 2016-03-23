class DealAllCards
  NUMBERS_OF_CARDS_DEALT_TO_PLAYERS_IN_EACH_DEALING_ROUND = [3, 4, 3]
  attr_reader :game

  def initialize(game)
    @game = game
  end

  # OPTIMIZE: Call CardDealt.create directly to avoid rebuilding GameState
  #   DealCard queries the GameState for deck, so GameState will be rebuilt each
  #   time, with one less card in the deck each time.
  #   Query the GameState once and keep the deck in memory, and then create all
  #   of the CardDealt events by sampling cards out of the in-memory deck.
  def call
    deal_cards if full_deck?

    full_deck?
  end

  private

  def deal_cards
    NUMBERS_OF_CARDS_DEALT_TO_PLAYERS_IN_EACH_DEALING_ROUND
      .each do |number_of_cards_dealt_to_players|
      deal_cards_to_players(number_of_cards_dealt_to_players)
      DealCard.new(game, :kitty).call
    end
  end

  def deal_cards_to_players(number_of_cards)
    Game::PLAYERS.each do |player|
      number_of_cards.times { DealCard.new(game, player).call }
    end
  end

  def full_deck?
    GameState.for(game).deck.size == GameState::COMPLETE_DECK.size
  end
end
