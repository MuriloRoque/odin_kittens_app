Rails.application.routes.draw do
  root 'kittens#index', as: 'home'
  resources :kittens
end
