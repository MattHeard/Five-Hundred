class Deck
  def initialize(game_state)
    @game_state = game_state
  end

  def call
    game_state.deck
  end

  private

  attr_reader :game_state
end
