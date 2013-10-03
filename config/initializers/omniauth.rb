Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1418043385077601', '38889494571b11bc18ebbae192e86673'
end