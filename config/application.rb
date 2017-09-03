require_relative 'boot'

require 'rails/all'
require 'multi_json'
require 'fuzzy_match'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nwmbr
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += %W(#{config.root}/lib) # add lib to the includes path

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max
  end
end
