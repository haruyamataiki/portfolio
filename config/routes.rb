Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations',
  passwords: 'customers/passwords'
  }
  # root to: 'rooms#show'
  root :to => 'homes#home'
  resources :homes
  resources :customers
  resources :recruitments
  # resources :chat_rooms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  mount ActionCable.server => '/cable'
end