Rails.application.routes.draw do  
  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations'}
  
  resources :users, only: [:show, :edit, :update]
  
  resources :users_admin, :controller => 'users'
  
  resources :items do
    resources :reviews, except: [:show, :index]
  end

  # Routing to HomePage
  root 'welcome#index'
end
