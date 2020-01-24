Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations',
  passwords: 'customers/passwords',
  confirmations: 'customers/confirmations'

  }
  #root to: 'rooms#show'
  root :to => 'homes#home'
  resources :homes


  resources :customers do
    resources :relationships,only: [:create,:destroy]
    resources :team_relationships,only: [:create,:destroy]
  end
  # resources :chat_rooms
  resources :recruitments
  resources :messages
  resources :teams


  # resourcesを使うとRESTfulなURLを自動生成できる
  resources :rooms, only: %i[show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  mount ActionCable.server => '/cable'
end