require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Treefinger
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec, fixture: true, views: false
      g.fixture_replacement :fabrication, dir: "spec/fabricators"
      g.integration_tool :rspec
    end

    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
