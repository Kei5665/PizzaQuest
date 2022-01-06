Rails.application.routes.draw do
  root 'games#index'

  namespace :admin do 
    resources :monsters
    resources :recipes
    resources :monster_recipes
  end
end
