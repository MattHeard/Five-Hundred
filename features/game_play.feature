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
