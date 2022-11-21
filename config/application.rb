require_relative "boot"
require "rails/all"
require "google-maps"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LetsGet
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    Google::Maps.configure do |config|
      config.authentication_mode = Google::Maps::Configuration::API_KEY
      config.api_key = GM_API = ENV.fetch('GOOGLE_MAPS_API')
      config.default_language = :en
      config.default_params = {
        directions_service: {
          mode: 'transit',
          transit_routing_preference: 'fewer_transfers' # this can be changed by user
        }
      }
      # config.default_language = :en
    end

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
