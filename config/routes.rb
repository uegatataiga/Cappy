Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do #ゲストログイン機能
    post "guest_sign_in", to: "sessions#guest_sign_in"
  end

  root to: 'homes#top'
  get 'items/search'
  get 'home/about' => 'homes#about', as: 'about'
  get 'genresearches/genre_search' => 'genresearches#genre_search' #ジャンル検索機能
  get "search" => "searches#search" #検索機能
  get 'users/mypage' => 'users#mypage'
  get 'users/check'
  patch 'users/is_withdraw' #ユーザーステータス

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

  resources :notifications, only: [:index,:destroy] #通知機能

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
