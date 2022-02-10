Rails.application.routes.draw do
  root 'monsters#index'
  get '/games/result', to: 'games#result'
  get '/games', to: 'games#index'
  get '/trial', to: 'trials#index'
  get '/trial/result', to: 'trials#result'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :grams
    resources :levels
    resources :monster_recipes
    resources :recipe_grams
  end

  resources :monsters
end
