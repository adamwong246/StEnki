# require 'gollum/frontend/app'

StEnki::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :users, :except =>['index', 'create', 'new', 'destroy']

  match "/about"           => "pages#show", :id => 'files/about',       :as => 'about',       :theme_color => :about
  match "/lab"             => "pages#show", :id => 'files/lab',         :as => 'lab',          :theme_color => :lab
  match "/lab/sampler"     => "pages#show", :id => 'files/lab/sampler', :as => 'html_sampler', :theme_color => :lab

  match "/pages" => "pages#index"
  match "/pages/:id" => "high_voltage/pages#show#:id"

  resources :comments, :theme_color => :lab

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    get ':year/:month/:day/:slug/comments'  => 'comments#index', :theme_color => :blog
    post ':year/:month/:day/:slug/comments' => 'comments#create'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new', :theme_color => :blog
    get ':year/:month/:day/:slug' => 'posts#show',  :theme_color => :blog
  end

  match "/archive" => 'posts#archive', :as => "posts_archive", :theme_color => :blog

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts, :theme_color => :blog
    get '(:tag)', :as => :posts, :theme_color => :blog
  end

  match "utility/flashecho" => 'utilities#flashecho', :as => 'flash_test'

  root :to => 'posts#index', :as => "blog", :theme_color => :blog
end
