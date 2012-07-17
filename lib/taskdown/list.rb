class Taskdown::List
  require 'taskdown/item'

  attr_accessor :name, :item_string

  def initialize(string)
    self.name, self.item_string = string.split("\n",2)
  end

  def items
    if item_string.nil?
      []
    else
      item_string.split(/^\n*-{3,}\n*|\n*i{3,}\n*/).select { |n| n.length > 0 }.map do |task|
        Taskdown::Item.new(task)
      end
    end
  end

end
