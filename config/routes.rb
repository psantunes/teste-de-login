Rails.application.routes.draw do
  resources :secure_users
  resources :insecure_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
