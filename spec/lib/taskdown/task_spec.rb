require 'spec_helper'

describe Task do

  let(:task_string) { File.read 'spec/fixtures/task.td' }
  let(:task) { Task.new(task_string) }

  describe '.new' do
    it "returns a task object" do
      task.task_string.should == task_string
    end
  end

  describe '#name' do
    it "returns the name of the task" do
      task.name.should == 'User signs in.'
    end
  end

  describe '#users' do
    it "returns all the users assigned to the task" do
      task.users.should == ['mrmicahcooper@gmail.com',
                            'bthesorcerer@gmail.com']
    end
  end

  describe '#parents' do
    it "returns assigned parent name" do
      task.parents.should == ['User account']
    end
  end

  describe 'tags' do
    it 'gets the tags from the description' do
      task.tags.should == ['signup', 'form']
    end
  end

  describe 'due_at' do
    it 'returns a time object for the due date' do
      task.due_at.should == Time.parse('8/8/2012 5:40PM')
    end
  end

  describe '#description' do

    let(:description) do
      <<-DESC
Given I am on the home page
When I go to the __signup__ page
And I fill in the following __form__:
- email
- password
And I submit it
Then I should have a new account
DESC
    end

    it 'returns the description' do
      task.description.should == description.strip
    end
  end


end
