@javascript
Feature: User deletes task
  Scenario:
    Given I am signed in
    And I have a project named "Treefinger"
    And that project has a task named "User signs in"
    And I am on the home page
    When I follow "x"
    Then I should not see "User signs in"
    And I follow "Treefinger"
    Then I should not see "User signs in"
