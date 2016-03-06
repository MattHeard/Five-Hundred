Feature: Shuffling the deck
  Scenario: The deck is shuffled in a new game
    Given I start a new game
    Then the deck will be shuffled
