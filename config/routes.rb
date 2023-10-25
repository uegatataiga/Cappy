Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    post "guest_sign_in", to: "sessions#guest_sign_in"
  end

  root to: 'homes#top'
  get 'items/search'
  get 'home/about' => 'homes#about', as: 'about'
  get 'genresearches/genre_search' => 'genresearches#genre_search'
  get "search" => "searches#search"
  get 'users/mypage' => 'users#mypage'
  get 'users/check'
  patch 'users/is_withdraw'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
    get :follows, :followers, :favorites
    end
    resource :relationships, only: [:create, :destroy]
  end


  resources :items, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    resource :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :notifications, only: [:index,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
