class Taskdown

  attr_accessor :projects_string

  def initialize(string)
    self.projects_string = string
  end

  def self.parse(string)
    projects = string.split(/^!/).select { |element| element.length > 0 }
    projectest.each map do |project|
      Project.new(project)
    end
  end

end

