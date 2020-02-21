Rails.application.routes.draw do  
  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations'}
  
  resources :users
  
  # devise_scope :user  do
  #   get 'users/index' => 'users#index'
    # get  'users/new' => 'users#new'
  #   post 'users/create' => 'users#create'
  # end
  
  resources :items do
    resources :reviews, except: [:show, :index]
  end

  # Routing to HomePage
  root 'welcome#index'
end
