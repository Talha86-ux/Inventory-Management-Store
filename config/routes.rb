Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: "users#index"
  resources :companies do
    resources :customers
    resources :suppliers
    resources :products
  end
  resources :orders
  resources :line_items

  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  delete 'users/delete', to: 'users#destroy'
  get 'edit_users/edit', to: 'users#edit'
  patch 'edit_users/edit', to: 'users#update'
end
