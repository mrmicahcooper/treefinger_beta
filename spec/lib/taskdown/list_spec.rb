require 'spec_helper'

describe Taskdown::List do

  let(:list_string) { File.read('spec/fixtures/list.td') }
  let(:list) { Taskdown::List.new(list_string) }

  describe ".new" do

    it "creates an object with the items string" do
      list.list_string.should_not be_nil
    end

    it "names the list" do
      list.name.should == "Treefinger application"
    end

  end

  describe '.items' do
    it 'returns a collection of items' do
      list.items.count.should == 2
    end
  end

end
