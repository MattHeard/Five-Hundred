Feature: Starting games
  Scenario: Start a game
    Given a player is on the index page
    When the new game link is clicked
    Then there is an empty scoreboard
    And there are 4 full hands of cards
    But only 1 hand of cards is visible
    And there is a full kitty
    And there are 0 bids
    And there is no contract
    And there is no trick
