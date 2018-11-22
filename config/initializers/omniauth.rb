require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "653d683e045c485d87c4e29b97e0f98b", "c6d68306e24f4b71adf9c88b1374727a", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
