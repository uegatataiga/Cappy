Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about'=>'homes#about', as: 'about'
  get '/genre/search' => 'searches#genre_search'
  resources :items do
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
            member do
            get :follows, :followers
            end
            resource :relationships, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
