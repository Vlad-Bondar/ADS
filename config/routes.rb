Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: "posts#index"

  get 'posts/posts_for_admin', to: 'posts#posts_for_admin'
  get 'posts/user_posts',   to: 'posts#user_posts'
  resources :posts do
    resources :images, only: [:create , :destroy]
  end
  resources :categories , only: [:create , :new , :destroy]
end
