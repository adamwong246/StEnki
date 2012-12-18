Enki::Application.routes.draw do
  

  # devise_for :users
  devise_for :users, :path => "accounts", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  # vvv Omniauth pure
  ##################
  # match "/signin" => "services#signin"
  # match "/signout" => "services#signout"

  # match '/auth/:service/callback' => 'services#create' 
  # match '/auth/failure' => 'services#failure'

  # resources :services, :only => [:index, :create, :destroy] do
  #   collection do
  #     get 'signin'
  #     get 'signout'
  #     get 'signup'
  #     post 'newaccount'
  #     get 'failure'
  #   end
  # end
  # ^^^ Omniauth pure
  ##################

  

  resources :users

  resources :archives, :only => [:index]
  # resources :pages, :only => [:show]

  # root :to => 'high_voltage/pages#show', :id => 'home'
  match "/pages/about_me" => "pages#show", :id => 'about_me', :as => 'about_me'
  match "/pages/about_stenki" => "pages#show", :id => 'about_stenki', :as => 'about_stenki'
  match "/pages" => "pages#index"
  # match "/pages/:id" => "high_voltage/pages#show#:id"

  resources :comments

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    get ':year/:month/:day/:slug/comments'  => 'comments#index'
    post ':year/:month/:day/:slug/comments' => 'comments#create'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new'
    get ':year/:month/:day/:slug' => 'posts#show'
  end

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get '(:tag)', :as => :posts
  end

  # put "/settings/" => "settings#update"

  root :to => 'posts#index'
end
