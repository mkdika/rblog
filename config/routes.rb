Rails.application.routes.draw do
  devise_for :user, :path => '/admin', :path_names => { :sign_in => 'login', :sign_out => 'logout' }, controllers: {sessions: "sessions", passwords: "passwords"}

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
      get 'comments', on: :member
    end

    resources :comments do
      get 'audit_trail', on: :member
      post 'create_from_post', to: 'create_from_post'
    end

    resources :users do
      patch 'lock', on: :member
      get 'audit_trail', on: :member
    end
  end

  get '/about', to: 'home#about', as: 'about'
  get '/posts/archive', to: 'home#archive', as: 'post_archive'
  get '/posts/:permalink', to: 'home#post', as: 'post_by_permalink'
  post '/posts/comments', to: 'home#create_comment', as: 'comment_by_post'
  root to: 'home#index'
end
