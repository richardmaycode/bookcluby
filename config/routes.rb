Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :recommendations, only: %w[index]
    resources :reads, only: %w[index show]
  end
end
