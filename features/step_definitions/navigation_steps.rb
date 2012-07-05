# require 'uri'
# require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When /^I am on the home page$/ do
  visit(root_path)
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

Then /^I should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
