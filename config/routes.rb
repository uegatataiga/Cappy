Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about"=>"homes#about", as: "about"

  get 'users/show'
  get 'users/edit'
  get 'users/index'
  get 'items/new'
  get 'items/show'
  get 'items/index'
  get 'items/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
