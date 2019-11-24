Rails.application.routes.draw do
  devise_for :user, :path => "/admin", :path_names => { :sign_in => "login", :sign_out => "logout" }

  scope :admin do
    get "/", to: "admin#index", as: 'admin_index'
    resources :categories
    resources :tags
    resources :posts
    resources :users
  end

  root to: "home#index"
end
