Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations',
  passwords: 'customers/passwords',
  confirmations: 'customers/confirmations'
  }

  root :to => 'homes#home'
  resources :homes

  resources :customers do
    resources :relationships,only: [:create,:destroy]
    resources :team_relationships,only: [:create,:destroy]
  end
  resources :recruitments
  resources :messages
  resources :teams

  resources :rooms, only: %i[show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  mount ActionCable.server => '/cable'
end