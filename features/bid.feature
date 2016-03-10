Feature: The bidding phase
  Scenario: The bidding player is on the dealer's left
    Given a game has started
    And the cards are dealt
    And the dealer is chosen
    Then the bidder is on the dealer's left
