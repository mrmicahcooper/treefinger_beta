class Taskdown
  require 'taskdown/list'

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def self.parse(string)
    new(string).lists.map do |p|
      Taskdown::List.new(p)
    end
  end

  def lists
    @lists ||= string.split(/^!/).select { |element| element.length > 0 }
  end

end
