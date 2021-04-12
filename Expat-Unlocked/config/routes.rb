Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'pages#home'
  get "pages/scan_info", to: "pages#scan_info", as: :scan_info
  resources :user_documents, only: %i[index create show edit destroy] do
    member do
      patch 'pay'
      patch 'unpaid'
    end
  end
  resources :user_documents, only: %i[update]
  # patch "user_documents/:id", to: "user_documents#update", as: :user_document_update
  resources :documents, only: %i[index show create]
  # GET   /profile => profiles#show
  resource :profile, only: [ :show ]
end


