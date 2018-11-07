Rails.application.routes.draw do
  root 'stock#index'

  devise_for :users, skip: :all
  devise_scope :user do
    get 'login', to: 'login#new'
    post 'login', to: 'login#create'
    get 'logout', to: 'login#destroy'
    get 'sign-up', to: 'registration#new'
    post 'sign-up', to: 'registration#create'
  end

  get 'stock/new', to: 'stock#new'
  post 'stock/new', to: 'stock#create'
  resources :stock, only: [:index, :show]
end
