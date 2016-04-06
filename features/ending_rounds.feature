Feature: Ending rounds
  Background:
    Given the game is in the play phase

  Scenario: No tricks are played
    When 1 trick has been played
    Then the round is not over

  Scenario: One trick is played
    When 1 trick has been played
    Then the round is not over

  Scenario: Two tricks are played
    When 2 tricks have been played
    Then the round is not over

  Scenario: Three tricks are played
    When 3 tricks have been played
    Then the round is not over

  Scenario: Nine tricks are played
    When 9 tricks have been played
    Then the round is not over

  Scenario: Ten tricks are played
    When 10 tricks have been played
    Then the round is over
