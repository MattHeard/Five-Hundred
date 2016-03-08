Feature: Deal a card
  Scenario: A card is dealt
    Given a new game has been started
    And the deck has 43 cards
    And the southern player's hand has 0 cards
    When a card is dealt to the southern player
    Then the deck has 42 cards
    And the southern player's hand has 1 card
