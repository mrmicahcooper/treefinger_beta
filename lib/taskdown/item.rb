class Taskdown::Item

  attr_accessor :item_string

  def initialize(item_string)
    self.item_string = item_string
  end

  def attr_hash
    {
      name: name,
      due_at: due_at,
      description: description
    }
  end

  def users
    @users ||= item_string.scan(/^\+.*$/).map do |user| 
      user[/[^+\s*]+/]
    end
  end

  def name
    @name ||= item_string[/^[\w\s]*\./]
  end

  def due_at
    date_string = item_string[/\d.+$/]
    @due_at ||= date_string.blank? ? nil : Time.parse(date_string)
  end

  def parents
    @parents ||= item_string.scan(/^@.+/).map do |parent|
      parent.gsub('@', '').strip
    end
  end

  def description
    @descrption ||= item_string.scan(/^[^!@#\+\n]+/)[1..-1].join("\n").strip
  end

  def tags
    @tags ||= description.scan(/__.*__/).map do |tag|
      tag.gsub("__", "").strip
    end
  end

end
