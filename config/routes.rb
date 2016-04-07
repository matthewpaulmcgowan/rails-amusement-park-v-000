Rails.application.routes.draw do
  root :to => "static#home"
  resources :users
  get 'signin' => "sessions#new"
  post 'signin' => "sessions#create"
  delete 'signout' => "sessions#destroy"
  resources :rides
  resources :attractions

end