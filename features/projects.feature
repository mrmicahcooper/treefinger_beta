Feature: Projects

  Scenario: User adds a project
    Given I am signed in
    And fill in "projects" with "! This is the new project"
    And I press "save tasks"
    Then I should have 1 new project
    And I should see "This is the new project"

  Scenario: User adds a project with a task
    Given I am signed in
    # the following step gets the text from 'spec/fixtures/sample_project.td'
    And I fill out the projects box
    And I press "save tasks"
    Then I should have 1 new project
    And I should see "Treefinger"
    And I should see "User signs in"

  Scenario: User views tasks per project
    Given I am signed in
    And I have a project named "Project 1"
    And that project has a task named "Task 1"
    And I have a project named "Project 2"
    And that project has a task named "Task 5"
    When I am on the home page
    Then I should see "Task 5"

    When I follow "Project 1"
    Then I should see "Task 1"

  Scenario: User adds a project to the current project with specifiying
    Given I am signed in
    When I fill in "projects" with "This task"
    And I press "save task"
    Then I should see "First Project"
