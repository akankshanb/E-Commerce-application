Rails.application.routes.draw do
  get 'payment/index'
  resources :line_items
  resources :carts
  # Routing to HomePage
  root to: 'welcome#index'

  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :items do
    resources :reviews, except: [:show, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
