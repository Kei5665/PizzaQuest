Rails.application.routes.draw do
  root 'monsters#index'
  get '/games/result', to: 'games#result'
  get '/games', to: 'games#index'

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
