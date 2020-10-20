Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  

  get 'posts/user_posts',   to: 'posts#user_posts'
  resources :posts 
  resources :categories , only: [:create , :new ]
end
