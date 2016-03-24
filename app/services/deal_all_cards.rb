class DealAllCards
  BATCH_SIZES = [3, 4, 3]

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
    BATCH_SIZES.each { |batch_size| deal_one_batch_round(batch_size) }
  end

  def deal_one_batch_round(batch_size)
    deal_one_batch_to_players(batch_size)
    deal_card_to_kitty
  end

  def deal_card_to_kitty
    DealCard.new(game, :kitty).call
  end

  def deal_one_batch_to_players(batch_size)
    players.each { |player| deal_batch_to_player(batch_size, player) }
  end

  def players
    Game::PLAYERS
  end

  def deal_batch_to_player(batch_size, player)
    batch_size.times { DealCard.new(game, player).call }
  end

  def full_deck?
    GameState.for(game).deck.size == GameState::COMPLETE_DECK.size
  end
end
