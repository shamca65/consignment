require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Consignment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.unknown_asset_fallback = false
    config.assets.digest = false
    config.assets.enabled = true
    #
    config.load_defaults 5.2
    config.assets.paths << Rails.root.join("app", "assets")
    config.assets.paths << Rails.root.join("vendor", "fa" )
    config.assets.paths << Rails.root.join("vendor", "fa", "svgs", "light")
    config.assets.paths << Rails.root.join("vendor", "fa", "svgs", "regular")
    config.assets.paths << Rails.root.join("vendor", "fa", "svgs", "solids")
    config.assets.paths << Rails.root.join("vendor", "fa", "svgs", "brands")
    config.assets.paths << Rails.root.join("vendor", "fa", "webfonts")
    config.assets.paths << Rails.root.join("vendor", "fa", "js")
    config.assets.paths << Rails.root.join("vendor", "fa", "css")
    config.autoload_paths += ["#{config.root}/lib"]
    #config.autoload_paths += ["#{config.root}/vendor"]
    config.colorize_logging = true
    #
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
  end
end
