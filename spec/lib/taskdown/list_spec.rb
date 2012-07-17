require 'taskdown'
require 'taskdown/list.rb'
require 'taskdown/item.rb'

describe Taskdown::List do

  let(:project_string) { File.read('spec/fixtures/project.td') }
  let(:project) { Taskdown::List.new(project_string) }

  describe ".new" do

    it "creates an object with the items string" do
      project.item_string.should_not be_nil
    end

    it "names the project" do
      project.name.should == "Treefinger"
    end

  end

  describe '.items' do
    it 'returns a collection of items' do
      project.items.count.should == 2
    end
  end

end
