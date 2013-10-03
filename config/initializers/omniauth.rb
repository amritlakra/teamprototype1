Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1393897487508946', 'dbeb350dc356f82d8059343af3268cae'
end