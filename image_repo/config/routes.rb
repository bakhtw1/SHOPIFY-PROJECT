Rails.application.routes.draw do
  # resources :user_items, only: [:index, :show, :destroy]
  resources :store_items
  resources :user_accounts
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'application#home'

  get 'store', to: 'store#home'
  post 'store_items/:id/buy_item', to: 'store_items#buy', as: 'buy_item'
end
