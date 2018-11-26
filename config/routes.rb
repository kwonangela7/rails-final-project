Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/generate', to: 'playlist#generate', as: 'generate'
  patch '/parse', to: 'playlist#parse', as: 'parse'
end
