# require 'gollum/frontend/app'

StEnki::Application.routes.draw do

  devise_for :users
  
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  # post "/rails_admin/post/import" => 'rails_admin/main#import'

  # require 'gollum/frontend/app'

  # Precious::App.set(:gollum_path, "git@github.com:adamwong246/StEnki.wiki.git")
  # Precious::App.set(:default_markup, :markdown) # set your favorite markup language
  # Precious::App.set(:wiki_options, {:universal_toc => false})
  # mount Precious::App, at: 'wiki'


  #, :path => '', :path_names => { :sign_in => "login", :sign_out => "signout", :sign_up => "register" }

  resources :users, :except =>['index', 'create', 'new', 'destroy']

  match "/pages/about_me" => "pages#show", :id => 'files/about_me', :as => 'about_me'
  match "/pages/about_stenki" => "pages#show", :id => 'files/about_stenki', :as => 'about_stenki'

  match "/about" => "pages#show", :id => 'files/about', :as => 'about'
  match "/lab" => "pages#show", :id => 'files/lab', :as => 'lab'

  match "/pages" => "pages#index"
  match "/pages/:id" => "high_voltage/pages#show#:id"

  resources :comments

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
