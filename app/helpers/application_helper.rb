module ApplicationHelper

  def right_arrow
    "&rarr;".html_safe
  end

  def left_arrow
    "&larr;".html_safe
  end

  def active_link(name, path, match)
    link_to(name, path, class: "#{'active' if action_name.match(match).present?}" )
  end

end
