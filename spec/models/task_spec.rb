require 'spec_helper'

describe Task do

  let(:task) { Fabricate(:task) }

  describe '#complete' do

    before { task.complete }

    it "adds a completed date" do
      task.completed?.should be_true
    end

  end

end
