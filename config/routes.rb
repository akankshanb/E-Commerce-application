Rails.application.routes.draw do
  # Routing to HomePage
  root to: 'welcome#index'

  # routing devise to use our custom registrations controller
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :items do
    resources :reviews, except: [:show, :index]
    # the subscribes
    resources :subscribes, except: [:show, :index]
  end

  #------------
  # the subscribes
  # resour
  # resources :subscribes
  # --------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
