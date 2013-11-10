Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'],:scope => 'email,user_birthday,read_stream', :display => 'popup'
end