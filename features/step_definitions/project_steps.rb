Then /^I should have (\d+) new projects?$/ do |project_count|
  @me.projects.count.should == project_count.to_i
end

When "I fill out the projects box" do
  projects = File.read('spec/fixtures/sample_project.td')
  fill_in('projects', :with => projects)
end
