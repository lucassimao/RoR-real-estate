Rails.application.routes.draw do
    root to: 'properties#index'

    match 'auth/sign_in', via: [:get, :post]
    get 'auth/sign_out'
    
    resources :properties do
        get :sale_offers, on: :collection
        get :renting_offers, on: :collection
    end
  resources :users
  resources :images

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
