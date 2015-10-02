Rails.application.routes.draw do

  resources :chat_rooms
  resources :chats
  resources :messages
  resource :users, :only=>[:show,:create,:destroy]
  root "messages#index"

end
