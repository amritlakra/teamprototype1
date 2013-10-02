Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['id'], ENV['key']
end