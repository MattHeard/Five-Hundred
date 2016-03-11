Feature: The bidding phase
  Scenario: The bidding player is on the dealer's left
    Given a new game has been started
    And all the cards are dealt
    And the dealer is chosen
    Then the bidder is chosen
    And the bidder is on the dealer's left

  Scenario: The first bidding player passes
    Given a new game has been set up
    And the bidder is chosen
    When the bidder passes
    Then the bidder has changed
    And there are no bids

  Scenario: Three bidders pass
    Given a new game has been set up
    When three bidders pass
    Then the dealer is the bidder
