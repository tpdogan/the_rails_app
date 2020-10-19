Rails.application.routes.draw do
  root 'cars#index'
  resources :cars
=begin
  get "/posts", to: "posts#index"
  get "/posts/:id", to: "posts#show"
  get "/posts/new", to: "posts#new"
  post "/posts", to: "posts#create"  # usually a submitted form
  get "/posts/:id/edit", to: "posts#edit"
  put "/posts/:id", to: "posts#update" # usually a submitted form
  delete "/posts/:id", to: "posts#destroy"

  /posts/1  # going to the #show action of the PostsController
  /posts/5  # also going to the #show action of PostsController

  resources :posts

  edit_post  GET  /posts/:id/edit(.:format)  posts#edit # helper

  link_to "Edit this post", edit_post_path(3) # don't hardcode 3!

  post_path(3, :referral_link => "/some/path/or/something") # add param

  resources :posts, only: [:index, :show]
  resources :users, except: [:index]

  get '/somepath', to: 'somecontroller#someaction'
=end
end