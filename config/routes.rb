Rails.application.routes.draw do
  root to: 'application#root_page'
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
end
