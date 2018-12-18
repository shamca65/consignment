require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Consignment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.enabled = true
    config.load_defaults 5.2
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "images")
    config.assets.paths << Rails.root.join("vendor", "assets", "img")
    config.assets.paths << Rails.root.join("vendor", "assets", "mdb-addons")
    config.autoload_paths += ["#{config.root}/lib"]
    config.action_controller.permit_all_parameters = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
  end
end
