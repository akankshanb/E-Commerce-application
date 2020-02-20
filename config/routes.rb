Rails.application.routes.draw do  
  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users
  
  resources :items do
    resources :reviews, except: [:show, :index]
  end

  # Routing to HomePage
  root to: 'welcome#index'
end
