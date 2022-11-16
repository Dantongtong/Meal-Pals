
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

# if Rails.env.test? || Rails.env.cucumber?
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end
#
#   # make sure our uploaders are auto-loaded
#   Dir.entries("#{Rails.root}/app/uploaders/").each do |file|
#     next if %w(. ..).include?(file)
#     require "#{Rails.root}/app/uploaders/#{file}"
#   end
#
#   # use different dirs when testing
#   CarrierWave::Uploader::Base.descendants.each do |klass|
#     next if klass.anonymous?
#     klass.class_eval do
#       def cache_dir
#         "#{Rails.root}/spec/support/uploads/tmp"
#       end
#
#       def store_dir
#         "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#       end
#     end
#   end
# end
