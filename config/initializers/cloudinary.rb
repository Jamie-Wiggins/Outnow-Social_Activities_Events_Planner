Cloudinary.config do |config|
    config.cloud_name = Rails.application.credentials.cloud_name
    config.api_key = Rails.application.credentials.cloud_api_key
    config.api_secret = Rails.application.credentials.cloud_secret
    config.secure = true
    config.cdn_subdomain = true
  end