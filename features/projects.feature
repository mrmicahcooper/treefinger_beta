Feature: Projects
  Scenario: User adds a project
    Given I am signed in
    And fill in "projects" with "! This is the new project"
    And I press "save tasks"
    Then I should have 1 new project
    And I should see "This is the new project"
