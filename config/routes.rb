Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/account", to: "pages#account"
  get "/my-pokemon", to: "pages#my_pokemon", as: "my_pokemon"
  get "/my-rentals", to: "pages#my_rentals", as: "my_rentals"
  get "/approvals", to: "pages#approvals", as: "approvals"

  resources :pokemons, only: [:index, :create, :new, :show] do
    resources :rentals, only: [:index, :create, :new]
  end

  resources :rentals, only: [:destroy, :update ]
end
