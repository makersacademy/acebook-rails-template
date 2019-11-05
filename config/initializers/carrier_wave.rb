require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
