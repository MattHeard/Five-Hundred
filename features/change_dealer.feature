Feature: Change the dealer
  Scenario: Pick a dealer when there is no dealer
    Given a new game has been started
    And there is no dealer
    When the dealer is changed
    Then there will be a dealer
