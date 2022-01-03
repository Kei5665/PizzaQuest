Rails.application.routes.draw do
  root 'games#index'

  namespace :admin do 
    resources :monsters
  end
end
