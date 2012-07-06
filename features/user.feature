Feature: User

  Scenario: User signs in with email
    Given I am on the home page
    And the following user:
      | email    | sam@example.com |
      | password | password        |
    When I fill in the following:
      | email    | sam@example.com |
      | password | password        |
    And I press "sign in"
    Then I should be on the root page

  Scenario: User signs out
    Given I am signed in
    When I follow "sign out"
    Then I should be on the sign in page
