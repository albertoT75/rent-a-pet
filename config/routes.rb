Rails.application.routes.draw do
  devise_for :users
  resources :pets do
    resources :rents, only: [:new, :create]
  end
  root to: 'pages#home'
  resources :rents, only: :index
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
