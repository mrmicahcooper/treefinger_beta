Given /^I am signed in$/ do
  email = 'sam@example.com'
  Fabricate(:user, email: email, password: 'password')
  page.visit sign_in_path
  step %Q(I fill in "email" with "#{email}")
  step %Q(I fill in "password" with "password")
  step %Q(I press "sign in")
end
