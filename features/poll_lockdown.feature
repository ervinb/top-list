Feature: Poll lockdown

    As the maker of the poll
    I should be able to lock it down
    So that I can invite others to vote

  @javascript
  Scenario: Lock the poll
    Given I am signed in
    And I am on the home page
    And I create a new poll MyPoll
    Then I should be able to lock it down
