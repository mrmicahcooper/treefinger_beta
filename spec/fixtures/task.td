User signs in
  Given I am on the home page
  When I go to the __signup__ page
  And I fill in the following __form__:
  - email
  - password
  And I submit it
  Then I should have a new account
