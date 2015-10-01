Rails.application.routes.draw do

  resources :chats
  resources :messages
  root "messages#index"

end
