require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "2b4d30aad82622c85c2e99537ceba64009ea3532896556f403599298f71e55c5"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')

  fetch_file_whitelist [              # List of allowed file paths when using fetch_file (strings or regexps)
    /public/
  ]
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
