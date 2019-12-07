Rails.application.routes.draw do
  devise_for :user, :path => '/admin', :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  scope :admin do
    get '/', to: 'admin#index', as: 'admin_index'

    resources :categories do
      get 'audit_trail', on: :member
    end

    resources :tags do
      get 'audit_trail', on: :member
    end

    resources :posts do
      get 'audit_trail', on: :member
    end

    resources :users do
      patch 'lock', on: :member
      get 'audit_trail', on: :member
    end
  end

  get '/posts/:permalink', to: 'home#post', as: 'post_by_permalink'
  root to: 'home#index'
end
