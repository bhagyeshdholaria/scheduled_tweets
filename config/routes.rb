# frozen_string_literal: true
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'about-us-new', to: 'about#index', as: :aboutpage

  root to: 'main#index'

end
