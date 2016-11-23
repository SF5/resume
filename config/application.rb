require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Resume
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.after_initialize do |app|
      app.routes.append{ match '*a', :to => 'application#not_found' } unless config.consider_all_requests_local
      Rails.application.config.assets.precompile += ['_cards.scss']
    end
  end
end

