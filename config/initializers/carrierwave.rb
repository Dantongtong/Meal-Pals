
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',                            # required
    aws_access_key_id:     ENV["S3_ACCESS_KEY"],            # required
    aws_secret_access_key: ENV["S3_SECRET_KEY"],            # required
    region:                ENV["S3_REGION"],            # to match the carrierwave and bucket region
  }
  config.fog_directory = ENV["S3_BUCKET"]                   # required
  config.fog_public    = false
  config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
  config.storage       = :fog

end