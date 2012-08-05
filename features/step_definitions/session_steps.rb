Given /^I am signed in$/ do
  email = 'sam@example.com'
  @me = Fabricate(:user, email: email, password: 'password')
  page.visit home_path
  step %Q(I fill in "email_or_username" with "#{email}")
  step %Q(I fill in "password" with "password")
  step %Q(I press "sign in")
end
