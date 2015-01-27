CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.fog_credentials = {
      :provider               => "AWS",
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
    }
    config.fog_directory = "bryon-ecommerce"
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog
  else
    config.storage = :file
  end
end