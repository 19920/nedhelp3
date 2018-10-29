Rails.application.routes.draw do
  root 'welcome_page#index'
  get 'welcome_page/index'
  get 'conversations/index'
  get 'welcome_page/location'
   post '/conversations/:conversation_id', to: 'messages#create'
  get 'welcome_page/home'
  get 'welcome_page/render_stats'
  get 'messages/index'
  get 'requests/index'
  get 'requests/request_counter'
  get 'users/sign_out'
  resources :requests
  devise_for :users
  resources :conversations, only: [:index, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :requests do
    member do
      patch 'volunteer'

      patch 'republish'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
