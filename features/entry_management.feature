Feature: Manage items in the polls

    As a creator of the poll
    I want to manage the items in the poll
    So that I can customize the poll

  @javascript
  Scenario: Entry creation
    Given I am on the home page
    And I am signed in
    And I create a new poll MyPoll
    When I edit the poll
    Then I should be able to add items to the poll

  @javascript
  Scenario: Entry removal
    Given I am on the home page
    And I am signed in
    And I create a new poll MyPoll
    When I edit the poll
    Then I should be able to remove items from the poll
