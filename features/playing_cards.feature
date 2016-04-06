Feature: Playing cards
  Background:
    Given the game is in the play phase

  Scenario: North plays ♣ in first trick
    When North plays A♣
    Then East can only play 8♣, 5♣, 10♣, or 6♣

  Scenario: North and East play ♣ in first trick
    Given North plays A♣
    When East plays 8♣
    Then South can only play Q♣ or K♣

  Scenario: North, East, and South play ♣ in first trick
    Given North plays A♣
    And East plays 8♣
    When South plays Q♣
    Then West can only play 9♣

  Scenario: North plays ♥ in first trick
    When North plays 5♥
    Then East can only play 4♥

  Scenario: North and East play ♥ in first trick
    Given North plays 5♥
    When East plays 4♥
    Then South can only play Q♥, 6♥, 8♥, or 7♥

  Scenario: North, East, and South play ♥ in first trick
    Given North plays 5♥
    And East plays 4♥
    When South plays Q♥
    Then West can only play 10♥ or J♥

  Scenario: North plays ♠ in first trick
    When North plays 5♠
    Then East can only play J♠, Q♠, or 9♠

  Scenario: North and East play ♠ in first trick
    Given North plays 5♠
    When East plays J♠
    Then South can only play A♠ or JOKER

  Scenario: North, East, and South play ♠ in first trick
    Given North plays 5♠
    And East plays J♠
    When South plays A♠
    Then West can only play K♠, 10♠, 8♠, or Jack♣

  Scenario: North plays ♦ in first trick
    When North plays 10♦
    Then East can only play 5♦

  Scenario: North and East play ♦ in first trick
    Given North plays 10♦
    When East plays 5♦
    Then South can only play 4♦, 6♦, or K♦

  Scenario: North, East, and South play ♦ in first trick
    Given North plays 10♦
    And East plays 5♦
    When South plays 4♦
    Then West can only play 7♦, Q♦, or 9♦

  Scenario: North plays ♥ in second trick
    Given North won the first trick
    When North plays 5♥
    Then East can only play 4♥

  Scenario: North and East play ♥ in second trick
    Given North won the first trick
    And North plays 5♥
    When East plays 4♥
    Then South can only play Q♥, 6♥, 8♥, or 7 or ♥

  Scenario: North, East, and South play ♥ in second trick
    Given North won the first trick
    And North plays 5♥
    And East plays 4♥
    When South plays Q♥
    Then West can only play 10♥ or J♥

  Scenario: North plays ♠ in second trick
    Given North won the first trick
    When North plays 5♠
    Then East can only play J♠, Q♠, or 9♠

  Scenario: North and East play ♠ in second trick
    Given North won the first trick
    And North plays 5♠
    When East plays J♠
    Then South can only play A♠ or JOKER

  Scenario: North, East, and South play ♠ in second trick
    Given North won the first trick
    And North plays 5♠
    And East plays J♠
    When South plays A♠
    Then West can only play K♠, 10♠, 8♠, or J♣

  Scenario: North plays ♦ in second trick
    Given North won the first trick
    When North plays 10♦
    Then East can only play 5♦

  Scenario: North and East play ♦ in second trick
    Given North won the first trick
    And North plays 10♦
    When East plays 5♦
    Then South can only play 4♦, 6♦, or K♦

  Scenario: North, East, and South play ♦ in second trick
    Given North won the first trick
    And North plays 10♦
    And East plays 5♦
    When South plays 4♦
    Then West can only play 7♦, Q♦, or 9♦

  Scenario: North plays ♣ in second trick
    Given North won the first trick
    When North plays 7♣
    Then East can only play 5♣, 10♣, or 6♣

  Scenario: North and East play ♣ in second trick
    Given North won the first trick
    And North plays 7♣
    When East plays 5♣
    Then South can only play K♣

  Scenario: North, East, and South play ♣ in second trick
    Given North won the first trick
    And North plays 7♣
    And East plays 5♣
    When South plays K♣
    Then West can play any of their cards
