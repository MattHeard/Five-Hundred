Feature: The index page
  Scenario: The index page contains a new game link
    Given I am on the index page
    Then I see "Start a new game"

  Scenario: Clicking the new game link starts a new game
    Given I am on the index page
    When I click "Start a new game"
    Then I see "Let's play 500!"
