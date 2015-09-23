require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BeatLib
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # for font path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # autoload from /lib
    config.autoload_paths << Rails.root.join('lib')
    # or require one file
    #require "#{Rails.root}/lib/pagination_link_renderer"

    # paperclip storage settings
    config.paperclip_defaults = { storage: :s3, s3_credentials: "#{Rails.root.join('config', 's3.yml')}", path: ":attachment/:style/:id.:extension", s3_host_name: "objects.dreamhost.com", s3_protocol: "https" }
  
    # foundation form builder gem
    config.action_view.default_form_builder = FoundationFormBuilder::Rails
  end
end
