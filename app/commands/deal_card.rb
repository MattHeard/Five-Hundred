class DealCard
  def initialize(game, player)
    @game, @player = game, player
  end

  def call
    deal_card if cards_remaining?

    cards_remaining?
  end

  private

  attr_reader :game, :player

  def deal_card
    game.with_lock { game.events << new_event }
  end

  def new_event
    CardDealt.new(card: card, player_seat: player)
  end

  def card
    deck.sample
  end

  def deck
    game_state.deck
  end

  def game_state
    CreateGameState.new(game).call
  end

  def cards_remaining?
    !deck.empty?
  end
end
