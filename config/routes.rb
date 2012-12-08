Enki::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  devise_for :users

  resources :archives, :only => [:index]
  # resources :pages, :only => [:show]

  # root :to => 'high_voltage/pages#show', :id => 'home'
  match "/pages/about" => "high_voltage/pages#show", :id => 'about', :as => 'about'
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


  root :to => 'posts#index'
end
