Feature: Bidding
  Background:
    Given the game is in the bidding phase

  Scenario: Every player passes
    When North passes their chance to bid
    And East passes their chance to bid
    And South passes their chance to bid
    And West passes their chance to bid
    Then there is no contract
    And the cards must be thrown in

  Scenario: Only North bids
    When North bids 6 of Spades
    And East passes their chance to bid
    And South passes
    And West passes
    Then the contract is for 6 of Spades
    And the contracting team is North-South

  Scenario: Only East bids
    When North passes
    And East bids 6 of Spades
    And South passes
    And West passes
    Then the contract is for 6 of Spades
    And the contracting team is West-East

  Scenario: East outbids North
    When North bids 6 of Spades
    And East bids 6 of Clubs
    And South passes
    And West passes
    And North passes
    Then the contract is for 6 of Clubs
    And the contracting team is West-East

  Scenario: South outbids North
    When North bids 6 of Spades
    And East passes their chance to bid
    And South bids 6 of Clubs
    And West passes
    And North passes
    Then the contract is for 6 of Clubs
    And the contracting team is North-South

  Scenario: North counter-outbids East
    When North bids 6 of Spades
    And East bids 6 of Clubs
    And South passes
    And West passes
    And North bids 6 of Diamonds
    And East passes
    Then the contract is for 6 of Diamonds
    And the contracting team is North-South

  Scenario: North counter-outbids South
    When North bids 6 of Spades
    And East passes their chance to bid
    And South bids 6 of Clubs
    And West passes
    And North bids 6 of Diamonds
    And East passes
    And South passes
    Then the contract is for 6 of Diamonds
    And the contracting team is North-South

  Scenario: South outbids North and East
    When North bids 6 of Spades
    And East bids 6 of Clubs
    And South bids 6 of Diamonds
    And West passes
    And North passes
    And East passes
    Then the contract is for 6 of Diamonds
    And the contracting team is North-South

  Scenario: North counter-outbids East and South
    When North bids 6 of Spades
    And East bids 6 of Clubs
    And South bids 6 of Diamonds
    And West passes
    And North bids 6 of Hearts
    And East passes
    And South passes
    Then the contract is for 6 of Hearts
    And the contracting team is North-South

  Scenario: East and South counter-outbid each other
    When North bids 6 of Spades
    And East bids 6 of Clubs
    And South bids 6 of Diamonds
    And West passes
    And North passes
    And East bids 6 of Hearts
    And South bids 7 of Spades
    And West passes
    And North passes
    And East bids 7 of Clubs
    And South passes
    Then the contract is for 7 of Clubs
    And the contracting team is West-East
