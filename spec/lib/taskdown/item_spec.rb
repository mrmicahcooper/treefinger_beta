require 'spec_helper'

describe Taskdown::Item do

  let(:item_string) { File.read 'spec/fixtures/task.td' }
  let(:task) { Taskdown::Item.new(item_string) }

  describe '.new' do
    it "returns a task object" do
      task.item_string.should == item_string
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

  describe "#attributes" do

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

    it "returns a hash of the task's attributes" do
      task.attributes.should == {
        task_string: item_string,
        name: "User signs in.",
        due_at: Time.parse('8/8/2012 5:40PM'),
        description: description.strip
      }
    end

  end


end
