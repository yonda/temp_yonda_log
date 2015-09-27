Rails.application.routes.draw do
  root 'welcome#index'

  resources :posts, only: %w(new)
end
