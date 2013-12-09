Feature: Poll management

    As a user
    I want to manage my polls
    So that I can customize them

  @javascript
  Scenario: Poll creation
    Given I am on the home page
    And I am signed in
    When I create a new poll MyPoll
    Then I should see MyPoll in my polls list

  @javascript
  Scenario: Poll removal
    Given I am signed in
    And I am on the home page
    And I create a new poll MyPoll
    Then I should be able to delete it

  @javascript
  Scenario: Poll editing
    Given I am signed in
    And I am on the home page
    And I create a new poll MyPoll
    Then I should be able to edit it
