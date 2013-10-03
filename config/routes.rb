Workplace::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }
  resources :services, expect: :show
  resources :places, except: :show
  resources :users, only: :show
  resources :providers, only: [:create, :destroy]
  resources :countries, except: :show
  resources :cities, except: :show
  resources :workstations

  root to: "home#index"
end
