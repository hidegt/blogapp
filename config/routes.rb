Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#top'
  #for users

  #for blog
  resources :blogs, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :blog_comments, only: [:create, :destroy]
  end
  #for user
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follow, :follower
    end
  end
  resources :relationships, only: [:create, :destroy]
  get "home/about" => "homes#about"
end
