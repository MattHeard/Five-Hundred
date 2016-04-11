# TODO Inject dependency on DealCard
class DealAllCards
  BATCH_SIZES = [3, 4, 3]

  def initialize(game)
    @game = game
  end

  def call
    deal_cards if full_deck?

    full_deck?
  end

  private

  attr_reader :game

  def deal_cards
    BATCH_SIZES.each { |batch_size| deal_one_batch_round(batch_size) }
  end

  def deal_one_batch_round(batch_size)
    deal_one_batch_to_players(batch_size)
    deal_card_to_kitty
  end

  # TODO Extract to deal_card(destination)
  def deal_card_to_kitty
    DealCard.new(game, :kitty).call
  end

  def deal_one_batch_to_players(batch_size)
    players.each { |player| deal_batch_to_player(batch_size, player) }
  end

  def players
    Seats.new.call
  end

  # TODO Extract to deal_card(destination)
  def deal_batch_to_player(batch_size, player)
    batch_size.times { DealCard.new(game, player).call }
  end

  def full_deck?
    game_state.deck.size == entire_deck.size
  end

  def entire_deck
    EntireDeck.new.call
  end

  def game_state
    CreateGameState.new(game).call
  end
end
