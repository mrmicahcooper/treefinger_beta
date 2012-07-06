Then /^I should have (\d+) new projects?$/ do |project_count|
  @me.projects.count.should == project_count.to_i
end
