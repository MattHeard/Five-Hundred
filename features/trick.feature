Feature: Playing a trick
  Scenario: A player plays a card
    Given a new game has been set up
    And the bidding phase has completed
    When the south player plays a card
    Then the south player's hand has 9 cards
    And the south player has a played card
