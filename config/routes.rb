Rails.application.routes.draw do

    get '/', to: 'categories#index'
    resources :categories
end
