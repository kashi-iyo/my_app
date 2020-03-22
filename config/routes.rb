Rails.application.routes.draw do
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
