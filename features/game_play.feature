Feature: Playing a game
  Scenario: Starting a game
    Given I am on the index page
    When I click on "Start a new game"
    Then I see a card
