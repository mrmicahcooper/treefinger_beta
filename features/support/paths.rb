module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/home'

    when /^that ([\w ]+)'s page$/
      polymorphic_path(instance_variable_get("@#{$1.parameterize('_')}"))

    when /^the ([\w ]+) page$/
      send("#{$1.parameterize('_')}_path")

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
