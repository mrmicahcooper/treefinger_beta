class Taskdown::List
  require 'taskdown/item'

  attr_accessor :name, :list_string

  def initialize(string)
    self.list_string = string
    set_list_name
    list_string.strip!
  end

  def set_list_name
    if list_string.slice!(/^!/)
      self.name = list_string.slice!(/^.*/).strip
    else
      self.name = ""
    end
  end

  def items
    if list_string.nil?
      []
    else
      list_string.split(/(?=\n\w)/).map do |task|
        Taskdown::Item.new(task.strip)
      end
    end
  end

end
