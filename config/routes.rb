Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' ,
  								  registrations: 'users/registrations',
  								  confirmations: 'users/confirmations',
  								  shared: 'users/shared'
  								}
 	resources :users, only: :show
  root to: "static_pages#home"
end
