Workplace::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }
  resources :places
  resources :users, only: :show
  resources :providers, only: [:create, :destroy]
  resources :countries, except: :show
  root to: "home#index"
end
