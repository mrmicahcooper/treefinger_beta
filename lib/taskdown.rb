class Taskdown
  require 'taskdown/list'

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def self.parse(string)
    new(string).lists.map do |list|
      Taskdown::List.new(list)
    end
  end

  def lists
    @list ||= string.split(/(?=^!)/)
  end

end
