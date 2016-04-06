Feature: Playing a game
  Scenario: Starting a game
    Given I am on the index page
    When I click on "Start a new game"
    Then I see 43 cards
    And I see 4 hands
    And I see the kitty
    And I see the current player token
    And I see the bid submission form
    And North-South has 0 tricks
    And West-East has 0 tricks

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
    And the non-current players' cards are not links

  Scenario: Playing the first card
    Given I have started a game
    And all players bid or pass
    When the King of Spades is clicked
    Then the King of Spades is in the trick

  Scenario: Completing a trick
    Given I have started a game
    And all players bid or pass
    When all players play a card
    Then no cards are links
    And the trick has 4 cards
    And South won the trick
    And North-South has 1 trick
    And West-East has 0 tricks

  Scenario: Starting a second trick
    Given I have started a game
    And all players bid or pass
    And all players play a card
    When I click "Continue"
    Then the trick has 0 cards

  Scenario: Completing the round
    Given I have started a game
    And all players bid or pass
    When all cards are played
    Then North-South has 0 tricks
    And West-East has 0 tricks
    And North-South has 10 points
    And West-East has 90 points

  Scenario: Starting a second round
    When I have completed a round
    Then the trick has 0 cards
