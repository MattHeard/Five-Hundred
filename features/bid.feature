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
    When 3 bidders pass
    Then the dealer is the bidder

  Scenario: A bid of 6 Spades
    Given a new game has been set up
    When the bidder bids 6 Spades
    Then the bidder has changed
    And the bid is 6 Spades

  Scenario: A bid must be higher than the previous bid
    Given a new game has been set up
    And the bidder bids 6 Spades
    And the bidder has changed
    Then the new bidder cannot bid 6 Spades

  Scenario: A bidder who has passed cannot bid again
    Given a new game has been set up
    When 4 bidders pass
    Then the new bidder cannot bid 6 Spades

  Scenario: The second bidder bids higher
    Given a new game has been set up
    And the bidder bids 6 Spades
    When the new bidder bids 7 Spades
    Then the highest bid is 7 Spades
