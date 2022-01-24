Rails.application.routes.draw do
  root 'monsters#index'
  get '/games/result', to: 'games#result'
  get '/games', to: 'games#index'
  get '/beginner/practice', to: 'beginner/practice#index'
  get '/beginner/practice/result', to: 'beginner/practice#result'
  get '/beginner/trial', to: 'beginner/trial#index'
  get '/beginner/trial/result', to: 'beginner/trial#result'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :monster_recipes
  end

  resources :monsters
end
