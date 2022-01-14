Rails.application.routes.draw do
  root 'games#index'
  get '/games/result', to: 'games#result'
  get '/games', to: 'games#index'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :monster_recipes
  end

  resources :monsters
end
