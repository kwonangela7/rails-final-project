Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/auth/spotify/callback", to: "users#spotify", as: 'spotify'
  get "/form", to: "playlist#collect", as: 'form'
  get "/generate", to: "playlist#generate", as: 'generate'
end
