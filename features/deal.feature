Feature: Dealing cards
  Scenario: Ten cards are dealt at the start of a round
    Given that a game has been created and I am on the gameplay page
    Then I see 10 cards dealt to me
