Rails.application.routes.draw do
  get "/", to: "admin#index"

  resources :categories
  resources :tags
  resources :posts

# This will used after we have 
# admin page & front page
#
#   scope :admin do
#     get "/", to: "admin#index"

#     resources :categories
#     resources :tags
#     resources :posts
#   end
end
