Feature: Playing a game
  Scenario: Starting a game
    Given I am on the index page
    When I click on "Start a new game"
    Then I see 43 cards
    And I see 4 hands
    And I see the kitty
    And I see the current player token
    And I see the bid submission form

  Scenario: Only the current player's cards are visible
    Given I have started a game
    And there is a current player
    Then the current player's hand is visible
    And the hands of non-current players are hidden

  Scenario: The bidding form
    Given I have started a game
    Then there is a bid_or_pass select field
    And there is a number_of_tricks select field
    And there is a trump_suit select field

  Scenario: The first bidder is clockwise of the dealer
    Given I have started a game
    And the dealer player is South
    Then the current player is West

  Scenario: Only the current player's hand is visible
    Given I have started a game
    Then West's hand is visible
    And North's hand is not visible
    And South's hand is not visible
    And East's hand is not visible

  Scenario: Bidding changes the current player
    Given I have started a game
    And the current player is West
    When West bids 6♠
    Then the current player is North
    
  Scenario: Cards are clickable
    Given I have started a game
    When all players bid or pass
    Then the current player's cards are links
