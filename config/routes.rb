Rails.application.routes.draw do
  root 'games#index'
  get '/games/result', to: 'games#result'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :monster_recipes
  end

  resources :monsters
end
