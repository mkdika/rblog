Rails.application.routes.draw do
  
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout" }

  get "/login", to: "home#login"
  
  scope :admin do
    get "/", to: "admin#index"
    resources :categories
    resources :tags
    resources :posts
  end
  
  root to: "home#index"
end
