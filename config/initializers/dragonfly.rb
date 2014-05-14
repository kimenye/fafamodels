require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "a8ca56f1f295c17ff588a3c3e86b1336e65b8a76d44d3b6db26514d23eec4c46"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
    ENV["S3_BUCKET_NAME"],
    ENV["S3_ACCESS_ID"],
    ENV["S3_ACCESS_KEY"]
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
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
