Rails.application.routes.draw do
  # Root page
  root 'users#home'

  # Login-register routes
  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'register' => 'users#new', as: :register
  post 'register' => 'users#create'
  get 'logout' => 'sessions#destroy', as: :logout

  # Menu route
  get 'home' => 'users#home', as: :home

  # Admin routes
  get 'users' => 'users#list', as: :users_list
  get 'block/:id' => 'users#block', as: :block
  get 'unblock/:id' => 'users#unblock', as: :unblock
  get 'payment/:id' => 'users#payment', as: :payment

  # Client routes
  get 'change' => 'users#change', as: :change
  get 'change/:id' => 'users#change_post', as: :change_post
  get 'recharge' => 'users#recharge', as: :recharge
  post 'recharge' => 'users#recharge_post'
end
