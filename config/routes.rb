# frozen_string_literal: true
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'about-us-new', to: 'about#index', as: :aboutpage

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'

  delete 'logout', to: 'session#destroy'

  root to: 'main#index'

end
