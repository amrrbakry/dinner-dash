Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    shared: 'users/shared' }
  resources :users, only: :show

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  root to: "items#index"
  namespace :admin do
    resources :categories do
      resources :items
    end
    resources :items
  end
  resources :items, only: %i[index show]

  resources :categories, only: %i[index show] do
    resources :items, only: %i[index show]
  end
end
