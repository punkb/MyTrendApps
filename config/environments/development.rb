Demo2::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.twitter_key = "HoVab6MwmTklrqD1J4Bw3A"
  config.twitter_secret = "1muXZ3UV0HKY8W3zc0Go9g1vhmXsfTopSzYujyyNTw"
  config.twitter_access_token = "54292452-QPFHB62vk7HzkFz2IqfQjMopjLo5p6dZGnmUuRchE"
  config.access_token_secret = "XqW0gM7RFHMz6u718MIblCjZ9PODnT255T8tTMDwj85Y8"

end