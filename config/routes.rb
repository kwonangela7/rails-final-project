Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root to: "home#generate"
 	# post '/generate', to: 'playlist#generate', as: 'generate'
 	# patch '/parse', to: 'playlist#parse', as: 'parse'
  root to: "home#index"
  get "/auth/spotify/callback", to: "users#spotify"
end
