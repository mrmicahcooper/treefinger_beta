class FormBuilder < ActionView::Helpers::FormBuilder

  def left_arrow
    "&larr;".html_safe
  end

  def text_field(method, options = {})
    text = ""
    unless object.nil? || options[:hide_errors]
      errors = object.errors[method.to_sym]
      if errors.present?
        text += " <span class=\"error\">#{left_arrow} #{errors.is_a?(Array) ? errors.first : errors}</span>"
      end
    end
    super(method, options) + text.html_safe
  end

  def email_field(method, options = {})
    text = ""
    unless object.nil? || options[:hide_errors]
      errors = object.errors[method.to_sym]
      if errors.present?
        text += " <span class=\"error\">#{left_arrow} #{errors.is_a?(Array) ? errors.first : errors}</span>"
      end
    end
    super(method, options) + text.html_safe
  end

  def password_field(method, options = {})
    text = ""
    unless object.nil? || options[:hide_errors]
      errors = object.errors[method.to_sym]
      if errors.present?
        text += " <span class=\"error\">#{left_arrow} #{errors.is_a?(Array) ? errors.first : errors}</span>"
      end
    end
    super(method, options) + text.html_safe
  end

end

ActionView::Base.default_form_builder = ::FormBuilder
