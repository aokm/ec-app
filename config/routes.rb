Rails.application.routes.draw do
  resources :shops do
    resources :items, only: [:index]
  end
  resources :temp_orders, only: %i[index create]
  resources :orders, only: [:create]
end
