Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root :to => 'homes#top'
  resources :users, only: [:show, :edit]
  resources :reports do
    resources :reviews, only: [:create]
  end
end
