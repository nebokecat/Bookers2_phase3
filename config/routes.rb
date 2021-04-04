Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

	devise_for :users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]
  post '/room/:id/chat', to: 'chats#create',as: :chat
  resources :users,only: [:show,:edit,:update,:index] do
    member do
      get 'followers'
      get 'followings'
    end
    resource :relationships, only: [:create, :destroy]
    resources :rooms,only: [:create,:show]
  end
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
