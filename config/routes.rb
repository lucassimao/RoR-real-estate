Rails.application.routes.draw do
  resources :users
  get 'auth/sign_in'
  get 'auth/sign_out'
  root to: 'properties#index'

  resources :properties do
        get :sale_offers, on: :collection
        get :renting_offers, on: :collection
  end
  resources :images

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
