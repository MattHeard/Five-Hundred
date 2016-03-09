class DealAllCards
  PLAYERS = %i{north south east west}

  def initialize(game)
    @game = game
  end

  # OPTIMIZE: Call CardDealt.create directly to avoid rebuilding GameState
  #   DealCard queries the GameState for deck, so GameState will be rebuilt each
  #   time, with one less card in the deck each time.
  #   Query the GameState once and keep the deck in memory, and then create all
  #   of the CardDealt events by sampling cards out of the in-memory deck.
  def call
    PLAYERS.each { |player| 3.times { DealCard.new(@game, player).call } }
    DealCard.new(@game, :kitty).call
    PLAYERS.each { |player| 4.times { DealCard.new(@game, player).call } }
    DealCard.new(@game, :kitty).call
    PLAYERS.each { |player| 3.times { DealCard.new(@game, player).call } }
    DealCard.new(@game, :kitty).call
  end
end
