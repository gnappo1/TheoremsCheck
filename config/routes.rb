Rails.application.routes.draw do

  root to: 'welcome#home'

  resources :subjects, except: :new do
    resources :areas, except: :index
  end

  resources :scientists do
    resources :theorems
  end
  resources :theorems

  post '/scientists/:id/unsave_scientist' => 'scientists#unsave_scientist', :as => :unsave_scientist
  post '/scientists/:id/save_scientist' => 'scientists#save_scientist', :as => :save_scientist
  post '/theorems/:id/unsave_theorem' => 'theorems#unsave_theorem', :as => :unsave_theorem
  post '/theorems/:id/save_theorem' => 'theorems#save_theorem', :as => :save_theorem

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :destroy]
  post '/users/:id/make_admin' => 'users#make_admin'
  get '/users/:id/areas_created' => 'users#areas_created'
  get '/users/:id/subjects_created' => 'users#subjects_created'
  get '/users/:id/theorems_created' => 'users#theorems_created'
  get '/users/:id/scientists_created' => 'users#scientists_created'
  get '/fav_theorems' => 'welcome#fav_theorems'
  get '/fav_scientists' => 'welcome#fav_scientists'
end
