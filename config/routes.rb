Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get '/genre/search' => 'searches#genre_search'
  get 'users/mypage' => 'users#mypage'
  get 'users/check'
  patch 'users/is_withdraw'

  resources :users, only: [:index, :show, :edit, :update] do
    member do
    get :follows, :followers, :favorites
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :items, only: [:index, :show, :edit, :update,  :new, :create, :destoroy] do
    resource :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
