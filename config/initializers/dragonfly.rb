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
      bucket_name: 'fafa-models-bucket',
      access_key_id: 'AKIAJFBRUSN5MPVT4VDQ',
      secret_access_key: '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'
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
