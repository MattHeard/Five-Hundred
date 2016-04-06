Feature: Ending games
  Background:
    Given the game is in the play phase

  Scenario: Both teams have 0 points
    When no points have been won
    Then the game is not over

  Scenario: One team has 500 points
    When North-South reaches 500 points
    Then the game is over

  Scenario: One team has -500 points
    When North-South reaches -500 points
    Then the game is over
