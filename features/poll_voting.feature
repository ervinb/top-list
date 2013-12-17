Feature: Voting on a poll

  As a visitor
  I want to vote on polls
  So that my vote has an effect on the final result

  Scenario: Vote on a poll
    Given a poll is created
    And I am on the poll's page
    When I vote on the poll
    Then I should see a success message
