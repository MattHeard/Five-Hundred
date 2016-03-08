Feature: Deal a card
  Scenario: A card is dealt to the southern player
    Given a new game has been started
    And the deck has 43 cards
    And the southern player's hand has 0 cards
    When a card is dealt to the southern player
    Then the deck has 42 cards
    And the southern player's hand has 1 card

  Scenario: Two cards are dealt to the southern player
    Given a new game has been started
    And a card is dealt to the southern player
    And the deck has 42 cards
    And the southern player's hand has 1 card
    When another card is dealt to the southern player
    Then the deck has 41 cards
    And the southern player's hand has 2 cards

  Scenario: A card is dealt to the western player
    Given a new game has been started
    And the deck has 43 cards
    And the western player's hand has 0 cards
    When a card is dealt to the western player
    Then the deck has 42 cards
    And the western player's hand has 1 card
