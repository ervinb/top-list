Feature: A visitor of the application can authenticate with the application

    As a visitor of the application
    I want to have my account 
    So that I can create new polls

  @javascript
  Scenario: User registration
    Given I am on the home page
    And I register
    Then I should see a Create Poll button

  @javascript
  Scenario: Signing in
    Given I am on the home page
    Then I should be able to sign in

  @javascript
  Scenario: Signing out
    Given I am on the home page
    And I am signed in
    Then I should be able to sign out
