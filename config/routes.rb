Rails.application.routes.draw do

  resources :chat_rooms do
  	resources :letters, :only=>[:create], :controller=>:chat_room_letters
  end
  resources :chats
  resources :messages
  resource :users, :only=>[:show,:create,:destroy]
  root "chat_rooms#index"

end
