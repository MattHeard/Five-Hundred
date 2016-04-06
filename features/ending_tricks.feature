Feature: Ending tricks
  Background:
    Given the game is in the play phase

  Scenario: One card is played
    When North plays A♣
    Then the trick is not complete

  Scenario: Two cards are played
    Given North plays A♣
    When East plays 8♣
    Then the trick is not complete

  Scenario: Three cards are played
    Given North plays A♣
    And East plays 8♣
    When South plays Q♣
    Then the trick is not complete

  Scenario: Four cards are played
    Given North plays A♣
    And East plays 8♣
    And South plays Q♣
    When West plays 9♣
    Then the trick is complete
