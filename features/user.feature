Feature: User

  Scenario: User registers successfully
    Given I am on the home page
    When I fill in the following:
      | user_email                 | sam@example.com |
      | user_username              | sam             |
      | user_password              | password        |
      | user_password_confirmation | password        |
    And I press "sign up"
    Then I should be on the root page

  Scenario: User signs in with email
    Given I am on the home page
    And the following user:
      | email    | sam@example.com |
      | password | password        |
    When I follow "sign in"
    When I fill in the following:
      | email_or_username | sam@example.com |
      | password          | password        |
    And I press "sign in"
    Then I should be on the root page

  Scenario: User signs in with username
    Given I am on the home page
    And the following user:
      | email    | sam@example.com |
      | username | sam             |
      | password | password        |
    When I follow "sign in"
    When I fill in the following:
      | email_or_username | sam      |
      | password          | password |
    And I press "sign in"
    Then I should be on the root page

  Scenario: User signs out
    Given I am signed in
    When I follow "sign out"
    Then I should be on the sign in page
