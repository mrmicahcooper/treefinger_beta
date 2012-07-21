@javascript
Feature: User views task descriptions
  Scenario:
    Given I am signed in
    # the following step gets the text from 'spec/fixtures/sample_project.td'
    When I fill out the projects box
    And I press "save"
    And I follow "User signs in"
    Then the "projects" field should contain "Given I am on the home page"
