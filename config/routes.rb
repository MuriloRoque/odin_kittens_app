Rails.application.routes.draw do
  root 'kittens#index', as: 'home'
  match "/kittens/apocalypse", to: "kittens#apocalypse", via: [:delete], as: :apocalypse_kittens
  resources :kittens do
    collection do
      delete :apocalypse
    end
  end
end
