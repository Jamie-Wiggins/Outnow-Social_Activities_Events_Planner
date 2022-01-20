require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Group13Outnow
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    #config.api_only = true
    config.action_controller.default_protect_from_forgery = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(

        '*', headers: :any, methods: :any
        )
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # load the twitter gem
   # config.autoload_paths << Rails.root.join('lib')
   config.time_zone = 'London'
  end
end
