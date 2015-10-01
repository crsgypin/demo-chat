Rails.application.routes.draw do

  resources :chats
  resources :messages
  resource :users, :only=>[:show,:create,:destroy]
  root "messages#index"

end
