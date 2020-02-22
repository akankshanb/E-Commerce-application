Rails.application.routes.draw do
  get 'payment/index'
  resources :line_items
  resources :carts
  # Routing to HomePage
  root to: 'welcome#index'
  resources :payment, :only => [:index, :show, :create]
  get :send_otp, to: 'payment#send_otp', as: :send_otp
  post :verify_otp, to: 'payment#verify_otp', as: :verify_otp

  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations'}
  
  resources :users, only: [:show, :edit, :update]
  
  resources :users_admin, :controller => 'users'
  
  resources :items do
    resources :reviews, except: [:show, :index]
  end

end
