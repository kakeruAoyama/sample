Rails.application.routes.draw do
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'tweets/index' => 'tweets#index'
  get 'tweets/new/' => 'tweets#new'
  post 'tweets' => 'tweets#create'
  root 'tweets#index'

  

  # :edit, :updateを追加
  resources :tweets, only: [:show, :edit, :update]
  # :destroyを追加
  resources :tweets,:destroy

  

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  #devise_for :users, controllers: {
  #        registrations: 'users/registrations'
  #}
end
