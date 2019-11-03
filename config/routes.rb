Rails.application.routes.draw do

    get '/', to: 'admin#index'

    resources :categories
    resources :tags
    resources :posts
end
