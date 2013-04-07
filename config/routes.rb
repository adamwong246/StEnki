# require 'gollum/frontend/app'

StEnki::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :users, :except =>['index', 'create', 'new', 'destroy']

  match "/about"           => "pages#show", :id => 'files/about',       :as => 'about'
  match "/lab"             => "pages#show", :id => 'files/lab',         :as => 'lab'
  match "/lab/sampler"     => "pages#show", :id => 'files/lab/sampler', :as => 'html_sampler'
  
  match "/lab/angular_experiment_1" => "pages#show", :id => 'files/lab/angular_experiment_1.html.slim'
  match "/lab/angular_experiment_2" => "pages#show", :id => 'files/lab/angular_experiment_2.html.slim'

  # match "/lab/stenki_analysis"     => "pages#show", :id => 'files/lab/stenki_analysis/index.html', :as => 'html_sampler', :theme_color => :lab
  # match "/lab/sampler"     => "pages#show", :id => 'files/lab/sampler', :as => 'html_sampler', :theme_color => :lab

  match "/pages" => "pages#index"
  match "/pages/:id" => "high_voltage/pages#show#:id"

  resources :comments, :theme_color => :lab

  resources :widgets

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    get ':year/:month/:day/:slug/comments'  => 'comments#index'
    post ':year/:month/:day/:slug/comments' => 'comments#create'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new'
    get ':year/:month/:day/:slug' => 'posts#show'
  end

  match "/archive" => 'posts#archive', :as => "posts_archive"

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get '(:tag)', :as => :posts
  end

  match "utility/flashecho" => 'utilities#flashecho', :as => 'flash_test'



  root :to => 'posts#index', :as => "blog"
end
