CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.fog_credentials = {
      :provider               => "AWS",       # required
      :aws_access_key_id      => "AKIAJZJ4JVIVKM6QILYA",       # required
      :aws_secret_access_key  => "Nh9zjlqQArcFHSwXIbJZHM8FiZR3gNIpiI75G3Rh",       # required
    }
    config.fog_directory = "sampleapp"
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog
  else
    config.storage = :file
  end
end