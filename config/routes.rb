# frozen_string_literal: true
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'about-us-new', to: 'about#index', as: :aboutpage

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'

  delete 'logout', to: 'session#destroy'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts

  root to: 'main#index'

end

# IyeT5mWpeR1XE9aHP5xLYhbbs
# TetzmRCh0tTmo9wtDQm8iCFii2RsOcvr5ZYLSTpHBMFqR7MGSl
# AAAAAAAAAAAAAAAAAAAAAFn3QwEAAAAAxL0LxrupLOkMAcjBF2pHyU%2BC6FA%3DIp47wzeusv97mvwtyJtYxOOJNgh6PpzGNHYf3v3IFZdQ4XmOxB
