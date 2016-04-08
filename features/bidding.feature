# TODO Refactor scenarios to highlight differences
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
    When North bids 6♠
    And East passes their chance to bid
    And South passes their chance to bid
    And West passes their chance to bid
    Then the contract is for 6♠
    And the contracting team is North-South

  Scenario: Only East bids
    When North passes their chance to bid
    And East bids 6♠
    And South passes their chance to bid
    And West passes their chance to bid
    Then the contract is for 6♠
    And the contracting team is West-East

  Scenario: East outbids North
    When North bids 6♠
    And East bids 6♣
    And South passes their chance to bid
    And West passes their chance to bid
    And North passes their chance to bid
    Then the contract is for 6♣
    And the contracting team is West-East

  Scenario: South outbids North
    When North bids 6♠
    And East passes their chance to bid
    And South bids 6♣
    And West passes their chance to bid
    And North passes their chance to bid
    Then the contract is for 6♣
    And the contracting team is North-South

  Scenario: North counter-outbids East
    When North bids 6♠
    And East bids 6♣
    And South passes their chance to bid
    And West passes their chance to bid
    And North bids 6♦
    And East passes their chance to bid
    Then the contract is for 6♦
    And the contracting team is North-South

  Scenario: North counter-outbids South
    When North bids 6♠
    And East passes their chance to bid
    And South bids 6♣
    And West passes their chance to bid
    And North bids 6♦
    And East passes their chance to bid
    And South passes their chance to bid
    Then the contract is for 6♦
    And the contracting team is North-South

  Scenario: South outbids North and East
    When North bids 6♠
    And East bids 6♣
    And South bids 6♦
    And West passes their chance to bid
    And North passes their chance to bid
    And East passes their chance to bid
    Then the contract is for 6♦
    And the contracting team is North-South

  Scenario: North counter-outbids East and South
    When North bids 6♠
    And East bids 6♣
    And South bids 6♦
    And West passes their chance to bid
    And North bids 6♥
    And East passes their chance to bid
    And South passes their chance to bid
    Then the contract is for 6♥
    And the contracting team is North-South

  Scenario: East and South counter-outbid each other
    When North bids 6♠
    And East bids 6♣
    And South bids 6♦
    And West passes their chance to bid
    And North passes their chance to bid
    And East bids 6♥
    And South bids 7♠
    And West passes their chance to bid
    And North passes their chance to bid
    And East bids 7♣
    And South passes their chance to bid
    Then the contract is for 7♣
    And the contracting team is West-East

  Scenario: Lower bids cannot beat higher bids
    When North bids 9♠
    And East bids 6♣
    Then the highest bid is for 9♠
