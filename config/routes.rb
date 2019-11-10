Rails.application.routes.draw do
  
  devise_for :users
  scope :admin do
    get "/", to: "admin#index"
    resources :categories
    resources :tags
    resources :posts
  end
  
  root to: "home#index"
end
