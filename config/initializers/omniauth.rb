Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :vkontakte, "4314801", "3bPA3LBtTD2lYwwlcUoj"
end