Rails.application.routes.draw do
  root 'monsters#index'
  get '/games/result', to: 'games#result'
  get '/games', to: 'games#index'
  get '/beginner/practice', to: 'beginner/practice#index'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :monster_recipes
  end

  resources :monsters
end
