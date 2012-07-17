Feature: Projects

  Scenario: User adds a project
    Given I am signed in
    And fill in "projects" with "! This is the new project"
    And I press "save tasks"
    Then I should have 1 new project
    And I should see "This is the new project"

  Scenario: User adds a project with a task
    Given I am signed in
    # the following step get the text from 'spec/fixtures/sample_project.td'
    And I fill out the projects box
    And I press "save tasks"
    Then I should have 1 new project
    And I should see "Treefinger"
    And I should see "User signs in"
