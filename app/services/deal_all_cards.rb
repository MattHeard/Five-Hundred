class DealAllCards
  BATCH_SIZES = [3, 4, 3]

  attr_reader :game

  def initialize(game)
    @game = game
  end

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
    Players.new.call
  end

  def deal_batch_to_player(batch_size, player)
    batch_size.times { DealCard.new(game, player).call }
  end

  def full_deck?
    CreateGameState.new(game).call.deck.size == EntireDeck.new.call.size
  end
end
