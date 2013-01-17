StEnki::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'

  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end

  resources :users

  match "/pages/about_me" => "pages#show", :id => 'files/about_me', :as => 'about_me'
  match "/pages/about_stenki" => "pages#show", :id => 'files/about_stenki', :as => 'about_stenki'
  match "/pages" => "pages#index"
  match "/pages/:id" => "high_voltage/pages#show#:id"

  resources :comments

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    get ':year/:month/:day/:slug/comments'  => 'comments#index'
    post ':year/:month/:day/:slug/comments' => 'comments#create'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new'
    get ':year/:month/:day/:slug' => 'posts#show'
  end

  match "/archive" => 'posts#archive'

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get '(:tag)', :as => :posts
  end



  root :to => 'posts#index'
end
