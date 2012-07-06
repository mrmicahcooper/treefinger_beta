class Taskdown
  require 'taskdown/project'

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def self.parse(string)
    new(string).projects.map do |p|
      Project.new(p)
    end
  end

  def projects
    @projects ||= string.split(/^!/).select { |element| element.length > 0 }
  end

end
