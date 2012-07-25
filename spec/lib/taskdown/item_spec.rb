require 'spec_helper'

describe Taskdown::Item do

  let(:item_string) { File.read 'spec/fixtures/task.td' }
  let(:item) { Taskdown::Item.new(item_string) }
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

  describe '.new' do
    it "returns an item object" do
      item.task_string.should == item_string
    end

    it "sets the name" do
      item.name.should == 'User signs in'
    end

    it "sets the description" do
      item.description.should == description
    end

  end

end
