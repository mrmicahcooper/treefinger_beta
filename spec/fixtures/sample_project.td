! Treefinger
User signs in
  Given I am on the home page
  When I go to the __signup__ page
  And I fill in the following form:
  - email
  - password
  And I submit it
  Then I should have a new account

User signs out
  Given I am on the home page
  When I go to the __signup__ page
  And I fill in the following form:
  - email
  - password
  And I submit it
  Then I should have a new account
