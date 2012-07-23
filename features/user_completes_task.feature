@javascript
Feature: User completes task
  Scenario:
    Given I am signed in
    And I have a project named "Treefinger"
    And that project has a task named "User signs out"
    And that project has a task named "User signs in"
    And I am on the home page
    When I complete "User signs in"
    Then I should not see "User signs in"

    When I follow "Treefinger"
    Then I should not see "User signs in"
    And that task should be completed

    When I follow "complete"
    Then I should see "User signs in"
    And I should not see "User signs out"

    When I follow "all"
    Then I should see "User signs in"
    And I should see "User signs out"
