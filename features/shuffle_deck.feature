Feature: Shuffling the deck
  Scenario: The deck is shuffled in a new game
    Given I start a new game
    Then the deck has 43 cards
    And the deck is shuffled

  Scenario: The deck order is maintained after being reloaded
    Given I start a new game
    And the deck is shuffled
    When I reload the game
    Then the deck order is unchanged
