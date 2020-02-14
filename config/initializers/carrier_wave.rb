if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['S3_ACCESS_KEY'],
      :region                   => ENV['S3_REGION']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    config.fog_provider = 'fog/aws'
  end
end