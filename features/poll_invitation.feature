Feature: Invite participants to vote

    As a creator of the poll
    I want to invite others to vote on it
    So that I can see their opinion

  @javascript
  Scenario: The maker of the poll invites others to vote
    Given I am signed in
    And I am on the home page
    And I create a new poll MyPoll
    When I lock down the poll
    Then I should be able to invite others
