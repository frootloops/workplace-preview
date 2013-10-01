Workplace::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }
  resources :places
  resources :users, only: :show
  root to: "home#index"
end
