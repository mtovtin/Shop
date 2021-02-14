Rails.application.routes.draw do
  root to: 'pages#index'

  resources :products, only: %i[show index] do
    member do
      post :cart, to: 'products#add_to_cart'
      delete :cart, to: 'products#remove_from_cart'
      patch :cart, to: 'products#change_count_in_cart'
    end

    collection do
      get :cart
    end
  end

  resources :orders, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
