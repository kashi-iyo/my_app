Rails.application.routes.draw do

  post "logout" => "users#logout"
  post "login" => "users#login"
  get "users/login_form" => "users#login_form"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/:id/show" => "users#show"
  post "users/create" => "users#create"
  get "users/new" => "users#new"
  get "users/index" => "users#index"

  get 'users/index'
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id/show" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/new" => "posts#new"
  get 'posts/index' => "posts#index"

  get '/' => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
