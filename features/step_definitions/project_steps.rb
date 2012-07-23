Then /^I should have (\d+) new projects?$/ do |project_count|
  @me.projects.count.should == project_count.to_i
end

When "I fill out the projects box" do
  projects = File.read('spec/fixtures/sample_project.td')
  fill_in('projects', :with => projects)
end

Given /^I have a project named "(.*?)"$/ do |project_name|
  @me.projects << Fabricate(:project, name: project_name)
  @project = @me.projects.last
end

Given /^that project has a task named "(.*?)"$/ do |task_name|
  @task = Fabricate(:task, name: task_name)
  @project.tasks << @task
end

Then /^the "([^"]*)" field should contain "([^"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^that task should be completed$/ do
  @task.reload.completed_at.should be_present
end

