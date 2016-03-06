Feature: Shuffling the deck
  Scenario: The deck is shuffled in a new game
    Given I start a new game
    Then the deck will have 43 cards
    And the deck will be shuffled
