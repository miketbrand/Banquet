Rails.application.routes.draw do
  root 'events#index'
  
  get 'profile' => 'users#edit'
  put 'updateUser' => 'users#update'
  get 'login' => 'users#login'
  put 'verify' => 'users#verify'
  put 'signup' => 'users#create'
  
  get 'mybanquets' => 'banquets#show'
  get 'findbanquets' => 'banquets#find'
  get 'newbanquet' => 'banquets#new'
  put 'createbanquet' => 'banquets#create'
  
  get 'transactions' => 'transactions#show'
  get 'rsvp/:id' => 'transactions#create', as: :rsvp
end
