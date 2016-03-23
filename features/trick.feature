Feature: Playing a trick
  Scenario: A player plays a card
    Given a new game has been set up
    And the bidding phase has completed
    When the south player plays a card
    Then the south player's hand has 9 cards
    And the south player has a played card

  Scenario: Four players play cards
    Given a new game has been set up
    And the bidding phase has completed
    When all players play a card
    Then the trick is complete
