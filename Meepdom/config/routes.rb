Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games, only: %i[index show]
  resources :user_games, only: %i[show new create edit update destroy] do
    resources :purchases, only: %i[index new create show]
  end
  resources :users, only: %i[show] do
    resources :user_games, only: %i[index]
  end
end
