require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module PokemonApi
  class Application < Rails::Application
    config.load_defaults 5.1
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource '*', :headers => :any, :methods => [:get, :post, :put, :delete, :options]
      end
    end
  end
end
