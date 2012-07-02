require_relative '../../app/models/project.rb'
require_relative '../../app/models/task.rb'

describe Project do

  let(:project_string) { File.read('spec/fixtures/project.td') }
  let(:project) { Project.new(project_string) }

  describe ".new" do

    it "creates an object with the tasks string" do
      project.task_string.should_not be_nil
    end

    it "names the project" do
      project.name.should == "Treefinger"
    end

  end

  describe '.tasks' do
    it 'returns a collection of Tasks' do
      project.tasks.count.should == 2
    end
  end

end
