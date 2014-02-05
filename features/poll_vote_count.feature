Feature: Poll vote count

    As a user
    I want to see the number of votes on my poll list
    So that I can know how many of the invited people voted

  @javascript
  Scenario: Poll shows vote count
    Given I am signed in
    And I am on the home page
    And I create a new poll MyPoll
    And I invite others to my poll
    Then I should see the number of invites and votes on the list
