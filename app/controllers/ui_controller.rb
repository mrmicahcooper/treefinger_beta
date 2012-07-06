class UiController < ApplicationController

  skip_before_filter :authenticate_user!

  expose(:task_string) do
    <<-TASK
User signs in. 8/8/2012 5:40pm
@ User account
+ mrmicahcooper@gmail.com
+ bthesorcerer@gmail.com

Given I am on the home page
When I go to the __signup__ page
And I fill in the following __form__:
- email
- password
And I submit it
Then I should have a new account
    TASK

  end

end
